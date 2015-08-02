# ui.R

shinyUI(fluidPage(
  mainPanel(
    uiOutput( "tabs" ),
    sliderInput( "tabs_no", "Integer:",  min=1, max=3, value=1)
  )
))