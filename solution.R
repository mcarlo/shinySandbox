test <- function(){
  library(shiny)
  db <- list()
  getTables <- function( n ){
    db <- lapply(seq_len( n ), data.frame, a = 1:2, b = LETTERS[1:2])
    return(db)
  }
  shinyApp(
    ui=fluidPage(
      mainPanel(
        uiOutput("tabs" ),
        sliderInput( "tabs_no", "Integer:",  min=1, max=3, value=1)
      )
    ),
    server=function(input, output) {
      db_tables <- reactive({
        return(getTables(input$tabs_no))
      })
      output$tabs <- renderUI({
        tbl<-db_tables()
        tables <- sapply(1:input$tabs_no, function(x){
          renderTable(tbl[[x]])
        })
        tagList(tables)
      })
    }
  )}

test()
