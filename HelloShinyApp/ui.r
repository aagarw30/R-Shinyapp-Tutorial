
# Load the shiny package
library(shiny)
# Define UI for the shiny application here
shinyUI(fluidPage(
# fluid pages scale their components in realtime to fill all available browser width.
  # Header Panel : Create a header panel containing an application title.
  titlePanel(title = "Hello Shiny, this is title panel"),
  # SidebarLayout():It creates a layout with a sidebar and main area. 
  sidebarLayout(
    # Sidebar panel
  sidebarPanel(h2("this is the sidebarpanel for input widgets 2"), 
               h3("this is the sidebarpanel for input widgets 3"),
               h4("this is the sidebarpanel for input widgets 4"),
               h5("this is the sidebarpanel for input widgets 5")
               ),
  # Main Panel
  mainPanel(h2("this is the main panel for display of output"),
            h3("this is the main panel for display of output"),
            h4("this is the main panel for display of output"),
            h5("this is the main panel for display of output")
            
            
            )
  )
  )
)
