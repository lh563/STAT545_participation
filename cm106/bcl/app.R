#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram,ui=user interface
# html file: 
# tags function: h1 and em function
# don't have to put tags everytime, such as h1 


bcl <- read.csv("~/Documents/STAT 545/Participation/parcipation/cm106/bcl/bcl-data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  titlePanel("BC Liquor price app", 
             windowTitle = "BCL app"),
  sidebarLayout(
    sidebarPanel("This text is in the sidebar."),
    mainPanel(
      plotOutput("price_hist"),
      tableOutput("bcl_data")
      )
  )
 )

# Define server logic required to draw a histogram
# server does not have to add "," between them

server <- function(input, output) {
  output$price_hist <- renderPlot(ggplot2::qplot(bcl$Price))
  output$bcl_data <- renderTable(bcl)
}

# Run the application 
shinyApp(ui = ui, server = server)

# if we make multiple files, the "ui" and "server" object will be made into two different files