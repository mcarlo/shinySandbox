#model.R

db <- list()
getTables <- function( n ){
  db <<- lapply(seq_len( n ), data.frame, a = 1:2, b = LETTERS[1:2])
  return(db)
}
getTableIndex <- function(){
  seq_along(db)
}