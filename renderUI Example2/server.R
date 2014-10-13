library(shiny)
shinyServer(function(input,output){
  
  output$tabs = renderUI({

# usual syntax of tabset - 
## tabsetPanel(tabPanel(title="")) ## for a single tab in the tabsetPanel,
## tabsetPanel(tabPanel(title=""), tabPanel(title="")) ## for two tabs in the tabsetPanel..and so on ..
## tabsetPanel(tabPanel(title=""), tabPanel(title=""),,......,, tabPanel(title="")) ## for n tabs in the tabsetPanel..and so on ..
#     imagine tab-1,tab no 1, tab-2, tab-3..tabn - these are the tab titles
#     using lapply(), we will apply the tabPanel function on each of tab title to get a list of tabPanel(s)
    # paste("tab no", 1:input$n, sep="-")
    Tabs <- lapply(paste("tab no.", 1:input$n, sep=" "), tabPanel)
  
# now we have the list of arguments and we can use the tabsetPanel function on this list of arguments and this could be achieved using the do.call() function
# do.call function allows you to call any R function, but instead of writing out the arguments one by one, you can use a list to hold the arguments of the function.
   
    do.call(tabsetPanel, Tabs)

  })
  
  

  
})

