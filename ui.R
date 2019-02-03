library(shiny)
library(tidyverse)

match = read.csv("~/polyrating/reviews.csv")
matrix = read.csv("~/polyrating/reviews_mat.csv")
head(match)

#matrix = read.csv("~/Spec/polymatchmatrix.csv")

shinyUI(fluidPage(
  
  titlePanel(title = h4("Polyrating Dating", align = "center")),
  
  sidebarLayout(
    sidebarPanel(("Match Your Profs!"), 
                 selectInput("selectedprof", "Select a Professor:", 
                             (unique(matrix$prof_name)))),
    mainPanel(("Most Similar Professors:"), 
               verbatimTextOutput("list")))
))
     