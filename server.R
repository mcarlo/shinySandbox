#server.R

library(shiny)
source("model.R")
shinyServer(function(input, output) {
  db_tables <- reactive({
    return(getTables(input$tabs_no))
  })
  output$tabs <- renderUI({
    tbl<-db_tables()
    tables <- sapply(1:input$tabs_no, function(x){
      renderTable(tbl[[x]])
    })
    tagList(tables)
  })})