library(shiny)

dataset = pulseRate

shinyUI(fluidPage(

    title = "Pulse Rates Data",
    
    fluidRow(
        column(2,h6("")),
        column(4,
            fluidRow(
                column(12,
                    h3("Pulse Rate Explorer"),
                    selectInput('x', 'X-Axis value', names(dataset)),
                    selectInput('y', 'Y-Axis Value', names(dataset))
                )
            ),
            fluidRow(
                column(12,
                    h3("Gender"),
                    checkboxInput("Males", label = "Males", value = FALSE),
                    checkboxInput("Females", label = "Females", value = FALSE),
                    h6(""),
                    textOutput("plotting")
                )
            ),
            fluidRow(column(12, h6(""))),
            fluidRow(
                column(2,h6("")),
                column(4, 
                      actionButton("goButton", "Update plot")
                ),
                column(4, tags$a(class="btn btn-default", href="https://albannach.github.io/developingdataproducts/DDP/help.html", "Documentation")),
                column(2,h6(""))
            )
        ),
        column(4,
            fluidRow(column(12, h6(""))),
            fluidRow(column(12,
                h6("Data source : Smyth, GK (2011). Australasian Data and Story Library (OzDASL). http://www.statsci.org/data."),
                h6("http://www.statsci.org/data/oz/ms212.txt"))
            ),
            fluidRow(column(12, plotOutput("pulsePlot")))
        ),
        column(2, h6(""))
    )
))