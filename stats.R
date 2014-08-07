#Loads the required Libraries
library(ggplot2)
library(scales)

#Reads in the required csv file
results <- read.csv(file='data.csv',sep=',',header=T)

#Smallen the amount
results$Amount <- results$Amount/10000

#Brak the results up into import and export for easy usage
import <- results[ which(results$Type=='Import'), ]
export <- results[ which(results$Type=='Export'), ]

#Creating a new png
png("importyear.png", width=6.75*300, height=6*300, res=300)

#Creates the plot that shows the amount spent on imports over the years
ggplot(data=import, aes(y=Amount, x=Year, group=Item, colour=Item)) + 
	geom_line() + 
	geom_point()+
	xlab("Years") +
	scale_y_continuous(label = comma)+
  	ylab("Amount Spent in the 0000's")+
	ggtitle("Money Spent \nBy the JA Government on Import's")

#Closing device
dev.off()

#Creating a new png
png("exportyear.png", width=6.75*300, height=6*300, res=300)

#Creates the plot that shows the amount earned on exports over the years
ggplot(data=export, aes(y=Amount, x=Year, group=Item, colour=Item)) + 
	geom_line() + 
	geom_point()+
	xlab("Years") +
	scale_y_continuous(label = comma)+
  	ylab("Amount Earned in the 0000's")+
	ggtitle("Money Earned \nBy the JA Government on Export's")

#Closing device
dev.off()

#Creating a new png
png("importtotal.png", width=6.75*300, height=6*300, res=300)

#Creates the plot that shows the amount spent in total on each import
ggplot(data=import, aes(x=Item, y=Amount,fill=Item)) + 
	geom_bar(stat="identity")+
	scale_x_discrete(breaks=NULL)+
	scale_y_continuous(label = comma)+
	xlab("Imported Items") +
  	ylab("Amount Spent in the 0000's")+
	ggtitle("Total Money Spent \nBy the JA Government on Each Import")

#Closing device
dev.off()

#Creating a new png
png("exporttotal.png", width=6.75*300, height=6*300, res=300)

#Creates the plot that shows the amount earned in total on each export
ggplot(data=export, aes(x=Item, y=Amount,fill=Item)) + 
	geom_bar(stat="identity")+
	scale_x_discrete(breaks=NULL,label = comma)+
	scale_y_continuous(label = comma)+
	xlab("Exported Items") +
  	ylab("Amount Earned in the 0000's")+
	ggtitle("Total Money \nEarned By the JA Government \non Each Export")

#Closing device
dev.off()

#Creating a new png
png("exportvimport.png", width=6.75*300, height=6*300, res=300)

#Creates the plot that shows exports vs imports
ggplot(data=results, aes(x=Type, y=Amount,fill=Type)) + 
	geom_bar(stat="identity")+
	xlab("Export Or Import") +
  	ylab("Amount in the 0000's")+
	scale_y_continuous(label = comma)+
	ggtitle("Export vs Import between 2008 - 2013")

#Closing device
dev.off()