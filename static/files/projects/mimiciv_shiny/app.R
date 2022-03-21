library(shiny)
library(dplyr)
library(ggplot2)
library(datasets)
library(tidyverse)
library(lubridate)

# import icu_cohort data as a tibble
data <- read_rds("icu_cohort.rds")

# select variables I plan to use
## demographics
demo_var1 = c("ethnicity", "language", "insurance", "marital_status", "gender")
demo_var2 = c("age_hadm")
## lab measurements
choice_lab <- c(50912, 50971, 50983, 50902, 50882, 
                51221, 51301, 50931, 50960, 50893)
choice_lab = paste("lab", choice_lab, sep = "")
## vitals
choice_chart <- c(220045, 220181, 220179, 223761, 220210)
choice_chart = paste("chart", choice_chart, sep = "")

ui <- fluidPage(
  titlePanel("Shiny app for exploring the ICU cohort"),
  sidebarLayout(
    sidebarPanel(
      selectInput("var", label = "Choose a variable",
                  choice = list(
                    "Ethnicity" = "ethnicity",
                    "Language" = "language",
                    "Insurance" = "insurance",
                    "Marital status" = "marital_status",
                    "Gender" = "gender",
                    "Age at hospital admission" = "age_hadm",
                    "Creatinine" = "lab50912",
                    "Potassium" = "lab50971",
                    "Sodium" = "lab50983",
                    "Chloride" = "lab50902",
                    "Bicarbonate" = "lab50882",
                    "Hematocrit" = "lab51221",
                    "White Blood Cell" = "lab51301",
                    "Glucose" = "lab50931",
                    "Magnesium" = "lab50960",
                    "Calcium" = "lab50893",
                    "Heart Rate" = "chart220045",
                    "Mean Non-invasive Blood Pressure" = "chart220181",
                    "Systolic Non-invasive Blood Pressure" = "chart220179",
                    "Body Temperature in Fahrenheit" = "chart223761",
                    "Respiratory Rate" = "chart220210"
                  ), 
                  selectize = FALSE),
      radioButtons("indicator", "Indicator",
                   c("None" = 0, "30-day mortality" = 1))
    ),
    mainPanel(
      h2("Numerical and graphical summary of the variable"),
      tableOutput("table"),
      verbatimTextOutput("sum"),
      plotOutput("box")
    )
  )
)

server <- function(input,output){
  output$table <- renderTable({
    if (input$var %in% demo_var1){
      if(input$indicator == 0){
        # numerical summary of categorical variables
        data %>%
          group_by_(input$var)  %>%
          summarize(n = n()) %>%
          mutate(prop = n / sum(n)) 
      } else {
        # numerical summary of categorical variables by indicator
        data %>%
          group_by_("thirty_day_mort", input$var) %>%
          summarize(n = n()) %>%
          mutate(prop = n / sum(n)) %>%
          select(-n) %>%
          spread("thirty_day_mort", prop)
      }
      
    } else {
      if(input$indicator == 0){
        # numerical summary of numerical variables
        data[input$var] %>%
          filter(. > 0) %>%
          na.omit() %>% 
          summarize_all(funs(
            Min    = min,
            Q1     = quantile(., 0.25),
            Median = median,
            Mean   = mean,
            Q3     = quantile(., 0.75), 
            Max    = max, 
            Sd     = sd))
      } else {
        # numerical summary of numerical variables by indicator
        data %>%
          select(input$var, "thirty_day_mort") %>%
          filter(.[, 1] > 0) %>%
          group_by_("thirty_day_mort") %>%
          na.omit() %>% 
          summarize_all(funs(
            Min    = min,
            Q1     = quantile(., 0.25),
            Median = median,
            Mean   = mean,
            Q3     = quantile(., 0.75), 
            Max    = max, 
            Sd     = sd)) %>%
          arrange(desc(thirty_day_mort))
      }
    }
  })
  output$box <- renderPlot({
    if (input$var %in% demo_var1){
      if(input$indicator == 0){
        # graphical summary of categorical variables
        data %>%
          ggplot() +
          geom_bar(mapping = 
                     aes_string(x = input$var, y = "..prop..", group = 1)) +
          labs(y = "percent") +
          labs(title = "Proportion for the selected variable") +
          coord_flip() 
      } else {
        # graphical summary of categorical variables by indicator
        data %>%
          ggplot() +
          geom_bar(mapping = 
                     aes_string(x = "thirty_day_mort", fill = input$var), 
                   position = "fill") +
          labs(y = "percent") +
          scale_y_continuous(labels = scales::percent) +
          labs(title = 
                 "Proportion for the selected variable by 30-day mortality") +
          labs(x = "30-day mortality")
      }
    } else {
      if(input$indicator == 0){
        # graphical summary of numerical variables
        data[input$var] %>%
          filter(. > 0) %>%
          na.omit() %>% 
          ggplot(aes_string(x = input$var)) +
          geom_boxplot() +
          labs(title = "Distribution for the selected variable") +
          labs(x = input$var) +
          theme(axis.title.y = element_blank(),
                axis.text.y = element_blank(),
                axis.ticks.y = element_blank())
      } else {
        # graphical summary of numerical variables by indicator
        data %>%
          select(input$var, "thirty_day_mort") %>%
          filter(.[, 1] > 0) %>%
          group_by_("thirty_day_mort") %>%
          na.omit() %>% 
          ggplot(mapping = aes_string(x = "thirty_day_mort", y = input$var)) +
          geom_boxplot() +
          labs(title = 
                 "Distribution for selected variable by 30-day mortality") +
          labs(x = "30-day mortality") +
          coord_flip() 
      }
    }
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
