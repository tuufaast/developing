library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Penguin chooser"),
  sidebarPanel(
    h6('Choose your preferred inputs and we tell you which penguin species you most likely like'),
    numericInput('id1', 'Height of the bird (0.3m-1.5m)', 0, min = 0.3, max = 1.5, step = 0.1),
    checkboxGroupInput("id2", "Region(s) you like",
                                          c("New Zealand" = "New Zealand",
                                            "Antarctica" = "Antarctica",
                                            "Africa" = "Africa",
                                          "South America" = "South America")),
  selectInput("area", "Preferred area",
              list("Sea" = "Sea", 
                   "Land" = "Land", 
                   "Glacier" = "Glacier"))
  ),
  mainPanel(

        h5('You chose the following variables'),
        verbatimTextOutput("collect"),
        h5('According to your choices, we predict that yout favourite penguin species is: '),
        verbatimTextOutput("prediction")                 
  
  )   
))