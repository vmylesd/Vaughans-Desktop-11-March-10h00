# Vaughans-Desktop-11-March-10h00

This is a basic interactive graph tool, under development

KEY ISSUES

1.  Add customisation controls

I wish to create interactive controls for the overall appearance of graphs.  These include text properties (font, face, colour, size, hjust and vjust, angle and lineheight), and axis, legend and title elements (axis.title, axis.ticks, plot.title, etc)
In other words, I hope to create interactive theme elements.  Dropdown menus on the UI would facilitate this.

My problem is that I do not know how to set up the server.  In other words, I cannot figure out how to lay out the theme in the server.  

There is a theme in Gloabl.R.  Do I change it in Global.R, or do I change it in Server.R.

2.  Package Reshape

We also have a problem representing data in the line chart.  We would like ti to display different lines for the different categories within a variable.  So I THINK we can solve this by melting the data and casting into a frame that includes aggregates for each vategory, then plot the aggregates.
Is this the correct way to go?

3.  Bar plot and subset dropdown

I know how to create a dropdown to select data according to a subset (categories of some variable, such as year).  I can get it to work for a boxplot, where two variables make up the ggplot aes.  I cant get the same script to work on a barchart, where there is only one variable in the ggplot aes

In the boxplot, my server reads:

p<-ggplot(subset(malldatachar, Year == input$Year))+ 
				aes_string(x=input$acol, y=input$bcol)
				
And in my barchart, my server reads:

p <- ggplot(selectedData()+
				subset(malldatachar, Year == input$Year)

Thats it.  I hope iot isnt too crazy!!
