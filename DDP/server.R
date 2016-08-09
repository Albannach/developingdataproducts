library(shiny)
library(data.table)
library(ggplot2)
pulseRate <- fread('http://www.statsci.org/data/oz/ms212.txt')
pulseRate$diff = pulseRate[,Pulse2]-pulseRate[,Pulse1]
pulseRate$Gender = factor(pulseRate$Gender)
pulseRate$Smokes = factor(pulseRate$Smokes)
pulseRate$Alcohol = factor(pulseRate$Alcohol)
pulseRate$Exercise = factor(pulseRate$Exercise)
pulseRate$Ran = factor(pulseRate$Ran)

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