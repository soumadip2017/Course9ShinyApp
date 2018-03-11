#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(ggplot2)

irisData <- iris
mycolor <-c("red","green3","blue")[as.factor(irisData$Species)]

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

  formulaText <- reactive({
    paste(input$variable)
   })
 
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  
  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(irisData)
  }) 

  # Generate a plot 
  output$irisplot <- renderPlot({
    
    plot(as.formula(formulaText()), 
         data = irisData,
         col = mycolor
         )
    legend('topright',
           legend = unique(irisData$Species), 
           col = c("red","green","blue"), 
           pch = 1
           )
  })

            
  # Generate an HTML table view of the data
  output$table <- renderTable({
    data.frame(irisData)
  })
              
})
