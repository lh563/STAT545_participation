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

a <- 5
print(a^2)

ui <- fluidPage(
  tags$h1('level 1 header'),
  h1(em('level 1 header,part 2')),
  HTML("<h1>level 1 header,part 3</h1>"),
  tags$a(href="https://shiny.rstudio.com/articles/tag-glossary.html","Click here!"),
  p(tags$b("This text is bold.")),
  br(),# start another line
  tags$iframe(src = "www.rstudio.com", seamless=NA)
 )

# Define server logic required to draw a histogram
server <- function(input, output) {
 
}

# Run the application 
shinyApp(ui = ui, server = server)

# if we make multiple files, the "ui" and "server" object will be made into two different files