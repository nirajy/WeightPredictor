#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Weight - Average Heights and Weights for American Women"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("height", "What's your Height", 58, 72, value = 65),
      checkboxInput("showModel", "Show Model", value = TRUE)
    ),
    mainPanel(
      plotOutput("plot"),
      h3("Predicted Weight from Model"),
      textOutput("pred")
      
    )
  )
))