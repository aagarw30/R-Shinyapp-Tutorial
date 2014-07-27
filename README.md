shinyapps
=========
This repository contains the ui.R and server.R as a fulfillment of the assignment from Coursera - Johns Hopkins - Developing Data Products course.

My shiny app is a histogram based on the variables from iris dataset.

I have tried to  demostrate how to use shiny widgets such as selectInput, sliderInput and radioButtons to take your inputs and then reactively construct the histogram based on those inputs.

For example:
User can select the choice of variable from the 4 iris dataset variables for the histogram using the selectInput widget. As the user changes the selection, histogram for the corresponding varibale is displayd,

User can also vary or change the number of BINs for the histogram using the sliderInput widget. The change in the number of BINs is reflected dynamically in the histogram,

User can also choose the color using the radioButton widget. Change is color is dynamically reflected in the histogram.

User interface and widgets are laid out in the ui.R file while the histogram is contructed in the server.R file.

User inputs are passed from ui.R to the server.R for computation and then plot is rendered and passed back to the ui.R for display.

The app also displays the user selection just above the histogram so that user might know what was the selection.

Please use the below URL to access the shiny app:
http://abhinav-agrawal.shinyapps.io/shinyasignment/

You would see the app with widgets on the left side in the sidebarpanel and the histogram would appear with the default selections in the main area.

Select the choices from the widgets that appear on the left side of the sidebarpanel(such as the dataset variable you would want to make the histogram, the number of BINs or the color),

As the selection is made, histogram would reflect those changes.
  
