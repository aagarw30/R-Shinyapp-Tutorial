## Intro shinydashboard package
## dashboardSidebar - add menu items

# install.packages("shinydashboard")

# Load the required package

library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Demo shinydashboard package - create menu items", titleWidth = 600),
    
    
    dashboardSidebar(
      # add menu items to the sidebar
      # menu items are like tabs when clicked open up a page in tab item
      sidebarMenu(
        menuItem(text = "About", tabName = "about", icon=icon("clipboard")),
        menuItem("Data", tabName = "data", icon=icon("database"), badgeLabel = "new", badgeColor = "green"),
        menuItem("Link to code files",  href = "https://www.google.com", icon=icon("code"))
        # https://fontawesome.com/icons?d=gallery
      )
    ),
    
    
    
    dashboardBody()
  )
)










# Group checkbox input in sidebarmenu
# https://stackoverflow.com/questions/32192656/how-to-create-a-checkboxgroup-under-a-menuitem-in-shiny-dashboard-sidebar?rq=1

# https://stackoverflow.com/questions/38686649/increase-length-of-the-shiny-dashboard-sidebar?rq=1

# https://stackoverflow.com/questions/31253351/r-shiny-dashboard-how-to-add-vertical-scrollbar-to-dashboard-sidebar?rq=1

# https://stackoverflow.com/questions/40374717/shiny-css-aligning-actionbuttons-in-shinydashboard-sidebar?rq=1

# https://stackoverflow.com/questions/36742932/r-shinydashboard-dynamic-menu-selection/36913826#36913826

# https://stackoverflow.com/questions/37033601/dynamic-sidebar-menu-rshiny/37133748#37133748

# https://stackoverflow.com/questions/31013769/locking-r-shiny-dashboard-sidebar-shinydashboard

# https://stackoverflow.com/questions/32971921/navigate-to-particular-sidebar-menu-item-in-shinydashboard
