library(shiny)
library(reshape2)
library(ggplot2)
library(RColorBrewer)
library(scales)

# Make sure the data is in the folder and names "maldatachar". 

malldatachar <- read.csv(paste(getwd() , "data.csv", sep="/"))

james_theme<-theme_bw()+
			theme(
		panel.grid.major = element_blank(),
		panel.grid.minor = element_blank(),
		panel.border = element_blank(),
		axis.line = element_line(colour="black"),
		axis.title.x = element_text(size=14, face="bold"),
		axis.title.y = element_text(size=14, face="bold"),
		legend.background = element_rect(size=1),
		legend.title = element_text(colour="black", face="bold", size=14),
		legend.text = element_text(colour="black"))
	

# Here are some ggplot themes
#dwmintheme <- theme(
#    panel.grid.minor = element_blank(), 
#    panel.grid.major = element_blank(),
#    panel.background = element_blank(),
#    plot.background  = element_blank(), 
#    axis.ticks = element_blank(),
#    axis.title = element_blank() ,
#    legend.background = element_blank()
#   # axis.text.x = element_blank()
 #   )
mindfoliopalcols<-c(
rgb( 0 , 138 , 128    , maxColorValue=255) , 
rgb( 34 , 27 , 129    , maxColorValue=255) , 
rgb( 191 , 18 , 56    , maxColorValue=255) , 
rgb( 0 , 176 , 240    , maxColorValue=255) , 
rgb( 255 , 153 , 0    , maxColorValue=255) , 
rgb( 127 , 127 , 127  , maxColorValue=255) , 
rgb( 121 , 115 , 194  , maxColorValue=255) , 
rgb( 217 , 150 , 148  , maxColorValue=255) , 
rgb( 0 , 112 , 192    , maxColorValue=255) , 
rgb( 0 , 176 , 80     , maxColorValue=255) , 
rgb( 128 ,  92 , 17   , maxColorValue=255) , 
rgb( 177 , 176 , 179  , maxColorValue=255) , 
rgb( 136 , 198 , 236  , maxColorValue=255) , 
rgb( 90 , 67 , 214    , maxColorValue=255) , 
rgb( 255 , 56 , 117   , maxColorValue=255) , 
rgb( 72 , 72 , 72     , maxColorValue=255) , 
rgb( 171 , 157 , 119  , maxColorValue=255) , 
rgb( 231 , 153 , 222  , maxColorValue=255) , 
rgb( 245 , 223 , 177  , maxColorValue=255) , 
rgb( 203 , 203 , 204  , maxColorValue=255) 
)

#mindfoliopal <- function(x)
#{
#if(x<=20)
#return(mindfoliopalcols)[1:x] else
#colorRampPalette(mindfoliopalcols)(x) #creates a function that returns colours

#}

# from code to name

Malls<-c("Deira", "Mirdif", "MoE")
	codeToName <- c(

	Age = "Age",	
	AgesOfChildren = "Ages of Children",	
	Income = "Income",	
	Dwell.Time = "Dwell Time",	
	Spend = "Spend",	
	Travel.Time = "Travel Time",
	Year = "Year",
	Mall = "Mall",
	VisitationFrequency = "Visitation"

  )

# from name to code
nameToCode <- names(codeToName)
names(nameToCode) <- codeToName

namesNumeric <- names( malldatachar[  , sapply( malldatachar , is.numeric ) ] )
namesFactor <- names( malldatachar[  , sapply( malldatachar , is.factor ) ] )
