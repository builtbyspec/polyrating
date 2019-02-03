library(shiny)
library(tidyverse)
library(plotly)
library(stringr)
library(shinythemes)

shinyServer(
  
  function(input, output){
    
      output$list = renderPrint({
      
      #dude = str_replace(input$selectedprof, ", ", "..")
      
      # dude = str_replace("Retsek, Dylan", ", ", "..")
      
      sorted = head(sort(matrix[[input$selectedprof]]))
      
      #   to_print = unlist(list(c(matrix$prof_name[which(matrix[[dude]] == sorted[1])], "\n")),
      #        matrix$prof_name[which(matrix[[dude]] == sorted[2])],    
      #       matrix$prof_name[which(matrix[[dude]] == sorted[3])],
      #      matrix$prof_name[which(matrix[[dude]] == sorted[4])],
      #     matrix$prof_name[which(matrix[[dude]] == sorted[5])])
      
      match$name_class[which(matrix[[input$selectedprof]] == sorted[1])]
      
      
      to_print <<- 
        unlist(list(    cat(paste(matrix$name_class[which(matrix[[input$selectedprof]] == sorted[1])], " Polyrating: ", match$agg_rating[which(matrix[[input$selectedprof]] == sorted[1])], "\n"),
                            paste(matrix$name_class[which(matrix[[input$selectedprof]] == sorted[2])]," Polyrating: ", match$agg_rating[which(matrix[[input$selectedprof]] == sorted[2])],"\n"),    
                            paste(matrix$name_class[which(matrix[[input$selectedprof]] == sorted[3])], " Polyrating: ",match$agg_rating[which(matrix[[input$selectedprof]] == sorted[3])],"\n"),
                            paste(matrix$name_class[which(matrix[[input$selectedprof]] == sorted[4])]," Polyrating: ", match$agg_rating[which(matrix[[input$selectedprof]] == sorted[4])],"\n"),
                            paste(matrix$name_class[which(matrix[[input$selectedprof]] == sorted[5])], " Polyrating: ",match$agg_rating[which(matrix[[input$selectedprof]] == sorted[5])],"\n" 
                            ), sep = "")))
      
      #to_print = as.character(to_print)
      #to_print
      
    })
  })

