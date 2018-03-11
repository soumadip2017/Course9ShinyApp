#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Study of iris data"),
  
  
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(

    
    
    
    includeHTML("readme.html"),
    
    br(),
    
    selectInput("variable", "Graph option:",
                list("Petal.Length ~ Sepal.Length", 
                     "Petal.Width ~ Sepal.Width",
                     "Petal.Width ~ Petal.Length",
                     "Sepal.Width ~ Sepal.Length"
                ))
    
  
  ),
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    tabsetPanel(
      tabPanel( h5(textOutput("caption")), plotOutput("irisplot")),
      tabPanel("Data Table", tableOutput("table")),
      tabPanel("Summary of iris data", verbatimTextOutput("summary"))


    
  )
  )
))