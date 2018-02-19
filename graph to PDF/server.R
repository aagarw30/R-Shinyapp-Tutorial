library(shiny)
library(ggplot2)
library(gridExtra)
shinyServer(function(input,output)({
  

  # downloadHandler contains 2 arguments as functions, namely filename, content
  output$down <- downloadHandler(
    filename =  function() {
      paste("multiplot.pdf")
    },
    # content is a function with argument file. content writes the plot to the device
    content = function(file) {
      pdf(file) # open the pdf device
      
      ## Plot multiple using par for multi-plots
      # par(mfrow=c(1,2))
      # layout(matrix(c(1,2), nrow=1, ncol = 2))
      # print(ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point())
      # print(ggplot(mtcars, aes(x=factor(am), y=mpg)) + geom_boxplot())
      ## Uncomment the below if you want to experiment with base plot system
      # plot(mtcars$mpg, mtcars$cyl)
      # plot(mtcars$cyl, mtcars$hp)
      # grid.table(iris)
      
      # m <- matrix(c(1, 0, 1,  3, 2, 3, 2, 0), nrow = 2, ncol = 4)
      ##set up the plot
      # layout(m)
      ## now put out the 3 plots to each layout "panel"
      # plot(1:10, main = "plot1")
      # plot(10:1, main = "plot2")
      # plot(rnorm(10), main = "plot3")
      p1 = ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
      p2 = ggplot(mtcars, aes(x=factor(am), y=mpg)) + geom_boxplot()
      # p3 = print(ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point())
      arrangeGrob(print(p1), print(p2), ncol = 2, main = "Main title")
      
      dev.off()  # turn the device off
    } 
  )
  
}))



# http://stackoverflow.com/questions/9699690/list-of-dataframes-to-pdf
# http://stackoverflow.com/questions/11774703/adding-text-to-a-grid-table-plot/11775211#11775211
# http://stackoverflow.com/questions/14321127/writing-data-frame-to-pdf-table
# 
# http://stackoverflow.com/questions/21558266/r-data-frame-to-table-image-for-presentation
# http://rfunction.com/archives/1538
# http://stackoverflow.com/questions/3881278/create-a-pdf-table?noredirect=1&lq=1
# http://stackoverflow.com/questions/25321462/how-to-use-shiny-conditional-panel