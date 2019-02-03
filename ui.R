library(shiny)
library(tidyverse)
library(shinythemes)

match = read_csv("~/Desktop/polymatch.csv")
head(match)

matrix = read_csv("~/Desktop/matrixboi.csv")

shinyUI(fluidPage(theme = shinytheme("darkly"),
  
  titlePanel(title = h4("Polyrating Dating", align = "center")),
  
  sidebarLayout(
    sidebarPanel(("Match Your Profs!"), 
                 selectInput("selectedprof", "Select a Professor:", 
                             (unique(matrix$name_class)))),
    mainPanel(("Most Similar Professors:"), 
              verbatimTextOutput("list")))
))