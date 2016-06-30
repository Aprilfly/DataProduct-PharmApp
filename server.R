library(shiny)
library(datasets)
library(UsingR)
library(manipulate)
data(Indometh)

IndoData<-Indometh
IndoData<-as.data.frame(IndoData)


shinyServer(function(input,output){
  output$oconc<-renderPrint({
    sub<-input$variable1
    t<-input$variable2
    concentration<-as.numeric(subset(IndoData,Subject==sub&time==t,select=c(conc)))
    concentration
  })
  output$conctime<-renderPlot({
    datasub<-subset(IndoData,Subject==input$variable1)
    plot(datasub$time,datasub$conc,main="Pharmocokinetics graph of Indomethacin",xlab="Time(hr)",ylab="Concentration(mcg/ml)",pch=19)
    axis(side=1,at=seq(0.0,8.0,by=1))
    lines(datasub$time,datasub$conc,col="red")
    
  })
  output$auc<-renderPrint({
    datasub<-subset(IndoData,Subject==input$variable1)
    conc<-datasub$conc
    time<-datasub$time
    AUC<-0
    for(i in 1:(nrow(datasub)-1)){
      Area<-(conc[i]+conc[i+1])*(time[i+1]-time[i])*0.5
      AUC<-AUC+Area
    }
    AUC
  })
  

 
})
