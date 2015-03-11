# UI for full dashboard

library(shiny)
library(ggplot2)

#import the dataset

filenames_data     <- list.files(path="data", pattern="\\.csv$")

shinyUI(fluidPage(

#application title

  titlePanel("MindFolio"),
     img(src="mind.png", height = 30, width = 30, bg="Transparent"),
  
  h4( "New Data Products" ),
   
#application sidebar/ inputs

  sidebarPanel(
      
      conditionalPanel(
      condition = "input.theTabs == 'firstTab' ",
        h3('Regression Plot'), 
		        selectInput('xcol', 'X Variable', choices = namesNumeric, selected = "Spend"),
		selectInput('ycol', 'Y Variable', choices = namesNumeric, selected = "Dwell.Time"),
        actionButton("downloadRegression","Save plot")),
		
      conditionalPanel(
      condition = "input.theTabs == 'secondTab' ",
        h3('Bubble Chart'),    
      	selectInput("xAxis","Select the first variable:", choices = nameToCode, selected = "Visitation"),
        selectInput("yAxis","Select the second variable:", choices = nameToCode, selected = "Dwell.Time"),
		actionButton("downloadBubble","Save plot")),
	  
	  conditionalPanel(
      condition = "input.theTabs == 'thirdTab' ",
        h3('Line chart'), 
       	selectInput("indicator","Select an indicator:", choices = namesNumeric, selected = "Dwell.Time"),    
      	selectInput("indicator2","Select an indicator:", choices = namesNumeric, selected = "Travel.Time"), 
		actionButton("downloadLine","Save plot")),
		
	  conditionalPanel(
      condition = "input.theTabs == 'fourthTab' ",
        h3('Boxplot'), 
        selectInput('acol', 'X Variable', choices = namesFactor, selected = "Age"),
		selectInput('bcol', 'Y Variable', choices = namesNumeric, selected = "Dwell.Time"),
         #       selected=names(nameToCode)[[2]]),
		actionButton("downloadBox","Save plot")),
		
	  conditionalPanel(
      condition = "input.theTabs == 'fifthTab' ",
        h3('Bar Chart'), 
		selectInput("ccol", "X Variable", choices= namesFactor, selected = "Income"),
		actionButton("downloadBar","Save plot")),
		
	   conditionalPanel(
       condition = "input.theTabs == 'sixthTab' ",
        h3('Polar chart'), 
		selectInput("pcol", "P Variable", choices= namesNumeric, selected = "Spend"),
		actionButton("downloadPolar","Save plot")),
		
		conditionalPanel(
       condition = "input.theTabs == 'seventhTab' ",
        h3('Stacked Area Chart'), 
		selectInput("sscol","Select an indicator:", choices = namesNumeric, selected = "Dwell.Time"),    
      	selectInput("ttcol","Select an indicator:", choices = namesNumeric, selected = "Spend"),
		actionButton("downloadStacked","Save plot"))
		),
		
#main panel
 
    mainPanel(
      tabsetPanel(
        tabPanel( "Regression", plotOutput("regression"), 
                  value = "firstTab"),
        tabPanel( "Bubble Chart", plotOutput("bubbleChart"),
                  value = "secondTab"),
		tabPanel( "Line Chart", plotOutput("timeSeries"),
                  value = "thirdTab"),
		tabPanel( "Box Plot", plotOutput("boxplot"),
                  value = "fourthTab"),
		tabPanel( "Bar Chart", plotOutput("barchart"),
                  value = "fifthTab"),
		tabPanel( "Polar Chart", plotOutput("polarchart"),
                  value = "sixthTab"),
		tabPanel( "Stacked Bar Chart", plotOutput("stackedareachart"),
                  value = "seventhTab"),
		id = "theTabs"
      ))))
	  