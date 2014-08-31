shinyapps - Reactive function
=========
Reactive Function in Shiny

So far we have seen render functions such as renderText(), renderPlot(), renderTable(). These functions are reactive – in the sense that they react to change in the user selection through the input widgets.

Another function in shiny having the reactive property is the reactive () function. Any expression given in the reactive function that depends on the input variable would change  (rather updates or re-evaluates) with any change in the input variable.

Why should we use the reactive function? 
Reactive expressions – when the expression is dependent on input variable and there is need for the expression to be reactive

Reusability – when you want the reactive function to evaluate an expression once and its value could be used within multiple render statements. That way the reactive expression need not to be calculated multiple time in each render statement.


