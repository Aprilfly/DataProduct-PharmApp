library(shiny)
shinyUI(pageWithSidebar(
  ##Define UI for pharmacokinetics Analysis Application
  headerPanel("Pharmacokinetics Analysis of Indomethacin"),
  sidebarPanel(
    selectInput("variable1","Subject:",list(1,2,3,4,5,6)),
    selectInput("variable2","Time(hr):",list(0.25,0.50,0.75,1.00,1.25,2.00,3.00,4.00,5.00,6.00,8.00)),
    submitButton("Submit"),
    checkboxInput("outliers","Show outliers",FALSE)
  ),
  mainPanel(
    div("The Application faciliates the medcine researchers to obtain the concentration of Indomethacin in plasma 
        according to subject number and time at which blood samples are drawn. At the same time, the pharmacokinetics 
        curve is rendered for different subjects.Area Under Curve(AUC) is an important parameter for pharmacokinetics
        researches, which represents the total drug exposure over time. This is useful when trying to determine whether 
        two formulations of the same dose release the same dose of drug to the body,which is also provided when choosing
        different subjects.",style="color:blue"),
    h4("The concentration of Indomethacin in plasma(mcg/ml)"),
    verbatimTextOutput("oconc"),
    h4("Pharmacokinetics Graph (concentration-Time)"),
    plotOutput("conctime"),
    h4("The Area Under Curve(AUC)"),
    verbatimTextOutput("auc")
  )
))
