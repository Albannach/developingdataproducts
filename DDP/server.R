library(shiny)
library(data.table)
library(ggplot2)

shinyServer(function(input, output) {
    x = reactive({paste("Plotting for ", if (input$Males) 'Males ' else '', if (input$Females) 'Females ' else '')})
    output$plotting = renderText({x()})
    output$pulsePlot = renderPlot({
        input$goButton
        isolate(
            if (input$Males && !input$Females)
                ggplot(pulseRate[Gender=='1'], aes_string(x=input$x, y=input$y)) + geom_point() + geom_jitter(width=.1, height=.1) 
            else if (input$Females && !input$Males)
                ggplot(pulseRate[Gender=='2'], aes_string(x=input$x, y=input$y)) + geom_point() + geom_jitter(width=.1, height=.1)
            else if (input$Females && input$Males)
                ggplot(pulseRate, aes_string(x=input$x, y=input$y)) + geom_point() + geom_jitter(width=.1, height=.1, aes(colour=Gender))
        )
    })
})