library(shiny)

dataset = pulseRate

shinyUI(fluidPage(

    title = "Pulse Rates data",
    
    fluidRow(
        column(3,
               h4("Pulse Rate Explorer"),
               selectInput('x', 'X-Axis value', names(dataset)),
               selectInput('y', 'Y-Axis Value', names(dataset)),
               checkboxInput('jitter', 'Jitter')
        ),
        column(3,
               h4("Gender"),
               checkboxInput("Males", label = "Males", value = FALSE),
               checkboxInput("Females", label = "Females", value = FALSE),
               textOutput("plotting")
        ),
        column(3,
               actionButton("goButton", "Update plot")
        ),
        column(3,
               h6("Data source : Smyth, GK (2011). Australasian Data and Story Library (OzDASL). http://www.statsci.org/data.")
        )
    ),
    
    plotOutput("pulsePlot")
))