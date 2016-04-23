
shinyServer( function(input, output) {
   child_height <- function(mother, father, gender){
    library(HistData)
    ### Create Data Frame
    height <- GaltonFamilies
    ### Load Caret
    library(caret)
    ### Split Data
    inTrain = createDataPartition(height$childHeight, p=.6)[[1]]
    training = height[ inTrain,]
    testing = height[-inTrain,]
    set.seed(1000)
    #### Used Gen Lin due to fact we are predicting a continous variable
    modelglm <- train(childHeight~father + mother + gender, method="glm", data=height)
    
    out <- predict(modelglm, list(input$mother, input$father, input$gender) )
    
    return(round(out,1))
  }
  
  output$oid1 <- renderText(child_height(input$mother, input$father, input$gender))
  
})