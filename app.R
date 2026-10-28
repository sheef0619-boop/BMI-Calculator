library(shiny)

ui <- fluidPage(
  
  titlePanel("BMI Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("weight",
                   "Weight (kg)",
                   value = 70),
      
      numericInput("height",
                   "Height (m)",
                   value = 1.75)
    ),
    
    mainPanel(
      h3("BMI Result"),
      textOutput("bmi"),
      hr(),
      p("Enter your weight and height to calculate BMI.")
    )
  )
)

server <- function(input, output) {
  
  output$bmi <- renderText({
    
    bmi <- input$weight/(input$height^2)
    
    paste("BMI =", round(bmi,2))
  })
}

shinyApp(ui = ui, server = server)