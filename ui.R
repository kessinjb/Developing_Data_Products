#### This is the UI page for my server app
###setwd("C:/Users/jbkessin/Documents/DDP_Project")

library(shiny)
shinyUI(fluidPage(
  titlePanel("Predicting a Child's Height"),
sidebarLayout(
sidebarPanel(

  radioButtons("gender", "Child Gender:", 
              c("male",
                "female" )),
  br(),
  sliderInput("father", label=h4("Father Height (inches)"), 69, min = 62, max = 78, step = 1),
  br(),
  sliderInput("mother", label=h4("Mother Height (inches)"), 64, min = 58, max = 70, step = 1)
  
),
mainPanel(
  tabsetPanel(type="tabs",
  tabPanel("Prediction",h3("Child's Predicted Height (inches)"),
  tableOutput("oid1")),
  tabPanel("Instructions", h4("
                              This application is designed to calculate how tall a child will be based on the
Child;s gender, the mother's height, and the father's height.  In order to see how tall the child will be, simply toggle
 the selection options on the left side of the application.
                              "))
  )
)
  
)))