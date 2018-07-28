#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Simulated Exponential Distribution"),
  
  sidebarLayout(
      sidebarPanel(
          
          h3("Step 1: Set Parameters"),
          
          h5("Move the sliders below to set inputs for simulation"),
          br(),
          ### 
          sliderInput("lambda",
                      "Rate Parameter:",
                      value = 1,
                      min = 0.5,
                      max = 1.5),
          br(),
          
          sliderInput("n",
                      "Number of Exponentials in Each Simulation:",
                      value = 50,
                      min = 1,
                      max = 100),
          br(),
          
          sliderInput("nosim",
                      "Number of Simulations:",
                      value = 500,
                      min = 1,
                      max = 1000),
          br(),
          
          h3("Step 2: Run Simulation"),
          actionButton("runSimulation", "Simulate")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
          # Output: Header + summary of distribution ----
          h3("Graph of Simulation Output"),
          plotOutput('plot')
      )
    )
))
