---
title: Biostatistics 200B Final Project
summary: Do spike protein IgG levels vary by peak COVID-19 disease severity?
tags:
- COVID-19
- ANCOVA
date: "2022-03-18"

# Activate this widget? true/false
active: false

# Optional external URL for project (replaces project detail page).
external_link: ""

image:
  caption: Photo by rawpixel on Unsplash
  focal_point: Smart

links:
# - icon: twitter
#   icon_pack: fab
#   name: Follow
#   url: https://twitter.com/georgecushen
url_code: ""
url_pdf: "/files/projects/200b-project2.pdf"
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
# slides: example
---
This project was the final assignment for Biostatistics 200B: Methods in Biostatistics B in Winter Quarter 2022.

The question was "Do spike protein IgG levels vary by peak COVID-19 disease severity?" To answer this question, I  fit a two-way ANCOVA model with peak disease severity and gender as the factors and days since symptom onset as a covariate, and get adjusted means and test for differences among the disease severity categories using a multiple comparison method. The dependent variable is spike protein IgG, which is positively skewed.
