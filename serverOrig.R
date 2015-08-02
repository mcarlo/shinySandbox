#server.R

library(shiny)
source("model.R")
shinyServer(function(input, output) {
  db_tables <- getTables( input$tabs_no )
  db_tab_ix  <- getTableIndex()

  output$tabs <- renderUI({
    tables <- lapply( db_tab_ix, function(x){
      tableOutput(paste( "tab", x, sep="_"))
    })
    tagList(tables)
  })

  for( x in db_tab_ix ){
    local({
      output[[paste( "tab", x, sep="_")]] <- renderTable( db_tables[[x]] )
    })
  }
})
