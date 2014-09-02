library(shiny)
require("maptools")
library(maptools)

india <- readShapePoly("india_st")
literacy <- read.csv("literacy.csv")

shinyServer(function(output,input)({
  output$ind <- renderPlot({
    
    rrt <- literacy[,as.numeric(input$year)]
    brks <- quantile(rrt, seq(0,1,1/7), na.rm=T)
    cols <- grey(2:(length(brks))/length(brks))
    dens <- (2:length(brks))*3
    plot(india,col=cols[findInterval(rrt, brks, all.inside=TRUE)])
    
  })
  
}))
