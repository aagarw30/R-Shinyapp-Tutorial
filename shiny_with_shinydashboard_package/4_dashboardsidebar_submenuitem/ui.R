## add sub menu items in shinydashboard sidebar

# load the required packages
library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Demo shinydashboard package - add sub menu items to sidebar - an example", titleWidth = 800),
    dashboardSidebar(
    sidebarMenu(id = 'sidebarmenu',
                  # first menu item
                  menuItem("Dashboard", tabName = "Dashboard", icon = icon("dashboard")),
                  
                  # second menu item with 2 sub menus
                  menuItem('chart',
                                    icon = icon('line-chart'),
                                    menuSubItem('chartmenusub1',
                                                tabName = 'chart1',
                                                icon = icon('line-chart')),
                                    menuSubItem('chartmenusub2',
                                                tabName = 'chart2',
                                                icon = icon('line-chart')

                  )))),
    
    
    dashboardBody(
        tabItems(
          tabItem("Dashboard", h4("this is the Dashboard tab page")),
          tabItem("chart1", h4("this is the chart1 tab page")),
          tabItem("chart2", h4("this is the chart2 tab page"))
                  )
        )
    )
  )
