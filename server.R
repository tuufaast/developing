library(shiny)

predictPenguin<-function(height, region, area){
  if(height<0.3 ){
    return("Select height at least 0.3m")
  }
  else if(height<=0.4 ||"New Zealand" %in% region){
    return("Little penguin")
  }
  else if(height>=1.0){
    return("Emperor penguin")
  }
  else if("Africa" %in% region ){  
    return("African penguin")
  }
  else if(height >=0.8 && "Antarctica" %in% region ){
    return("King penguin")
  }
  else if("Antarctica" %in% region ){
    return("Adelie penguin")
  }
  else if(area == "Land"){
    return("Rockhopper penguin")
  }
  else{
    return("Gentoo penguin")
  }
  
}


shinyServer(
  function(input, output) {
    output$collect <- renderPrint({paste("Height: ",input$id1,"m,  preferred region(s): ", 
                            paste(unlist(input$id2), collapse=", "), " and preferred area: ", input$area, sep="")})
    output$prediction <- renderPrint({predictPenguin(input$id1,input$id2, input$area)})
  }
)