library(shiny)
library(ggplot2)

shinyServer(function(input,output){
  
#SCATTERPLOT

#specify data

selectedData <- reactive({malldatachar})

#specify plot
 
plotInput1 <- reactive({
 				p <- ggplot(selectedData(), aes_string(x=input$xcol, y=input$ycol)) + 
				geom_point(colour="black", fill="lightblue")+
				james_theme
						})
					
output$regression<-renderPlot({
		print(plotInput1())
							})

#saving function

observe({
if(input$downloadRegression>0)
isolate({
          ggsave(filename="test1.png", plot=plotInput1(), units="cm")
  })
  })
	
							
#BARPLOT

#specify data

selectedData <- reactive({malldatachar})

#specify plot
 
plotInput2 <- reactive({
				p <- ggplot(selectedData(), aes_string(x=input$ccol)) + 
				geom_bar(colour="black", fill="lightblue")+
				james_theme
						})
					
 output$barchart <- renderPlot({
					print(plotInput2())
								})
							
#saving function

observe({
if(input$downloadBar>0)
isolate({
          ggsave(filename="test2.png", plot=plotInput2(), units="cm")
  })
  })
  
#LINE CHART

#specify data

 selectedData <- reactive({malldatachar})

#specify plot
 
plotInput3 <- reactive({
				p <- ggplot(selectedData(), aes_string( x = input$indicator2, y = input$indicator)) +
				#geom_line()
				stat_smooth(se = F, method = "lm", formula = y ~ poly(x, 8))+
				james_theme
						})
					
output$timeSeries <-  renderPlot({
					print(plotInput3())    
									})

#saving function

observe({
if(input$downloadLine>0)
isolate({
          ggsave(filename="test3.png" , plot=plotInput3(), units="cm")
  })
  })
  
# BUBBLE CHART
 
#specify data
 
 selectedData <- reactive({malldatachar})
 
 #specify plot
 
 plotInput4 <- reactive({
				p <- 	ggplot(selectedData(), aes_string(x = input$xAxis,y = input$yAxis, size="Spend"))+
				geom_point(shape=21, colour="black", fill="lightblue")+
				scale_size_area()+
				james_theme
							})
					
 output$bubbleChart <- renderPlot({    
						print(plotInput4())
									})
  
#saving function

observe({
if(input$downloadBubble>0)
isolate({
          ggsave(filename="test4.png" , plot=plotInput4(), units="cm")
  })
  })
  
# BOXPLOT
 
#specify data

selectedData <- reactive({malldatachar})

#specify plot 

plotInput5 <- reactive({
				p<-ggplot(selectedData(), aes_string(x=input$acol, y=input$bcol)) + 
				geom_boxplot(colour="black", fill="lightblue")+
				coord_flip()+
				james_theme
						})
						
output$boxplot <- renderPlot({
						print(plotInput5())	
								}) 
 
#saving function

observe({
if(input$downloadBox>0)
isolate({
          ggsave(filename="test5.png" , plot=plotInput5(), units="cm")
  })
  })
  
#POLAR CHART
 
#specify data
 
selectedData <- reactive({malldatachar})
 
#specify plot
 
plotInput6 <- reactive({
				p <- ggplot(selectedData(), aes_string(x=input$pcol, fill="Age")) + 
				geom_histogram(colour="black")+
				coord_polar()+
				scale_x_continuous(limits=c(0,360), breaks=seq(0,360,by=45))+
				scale_fill_brewer()
				#james_theme
						})
						
output$polarchart <- renderPlot({
						print(plotInput6())	
									}) 
 
#saving function

observe({
if(input$downloadPolar>0)
isolate({
          ggsave(filename="test6.png" , plot=plotInput6(), units="cm")
  })
  })
  
 #STACKED AREA CHART
  
#specify data
 
selectedData <- reactive({malldatachar})
 
#specify plot
 
plotInput7 <- reactive({
				p <- ggplot(selectedData(), aes_string( x = input$sscol, y = input$ttcol)) +
				geom_area(colour="black", fill="lightblue")+
				geom_point(colour="black")+
				james_theme
						})			

output$stackedareachart <- renderPlot({
								print(plotInput7())	
										}) 
 
#saving function

observe({
if(input$downloadStacked>0)
isolate({
         ggsave(filename="test7.png" ,plot=plotInput7(), units="cm")
	})
	})
	})
