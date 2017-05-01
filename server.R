#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
  
  model <- lm(weight ~ height,data = women)
  
   modelpred <- reactive({
     heightInput <- input$height
     predict(model, newdata = data.frame(height = heightInput))
   })
   
   
   output$plot <- renderPlot({
     heightInput <- input$height
     
     plot(women$height, women$weight, xlab = "Height", 
          ylab = "Weight", bty = "n", pch = 16,
          xlim = c(55, 75), ylim = c(100, 180))
      if(input$showModel){
        abline(model, col = "red", lwd = 2)
      }
     points(heightInput, modelpred(), col = "blue", pch = 16, cex = 2)
     abline(h=modelpred(),col=4,lty=3) 
     abline(v=heightInput,col=4,lty=3)
    
   })
   
   output$pred <- renderText({
     modelpred()
   })
  
})