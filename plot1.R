##
## Load library "datasets" to work with tables
##
library(datasets)
##
## Create working directory and set it up
##
setwd("c:/")
if (!file.exists("tmp")) {
  dir.create("tmp")
}
setwd("c:/tmp")
##
## Download file from URL, unzip it and load it into "powerData" variable
##
temp <- tempfile()
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = temp)
dateDownloaded <- date()
powerData <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
head(powerData)
##
## Extract part of the data needed for this assignment
##
powerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]
##
## Initialize graphics device
##
png(filename = "plot1.png", width=480, height=480)
##
## Create histogram as shown in assignment
## Specify labels, color and size of a histogram 
##
hist(powerData$Global_active_power, xlab="Global Active Power (killowats)", main="Global Active Power", col="red",cex.axis=0.7,cex.main=0.7,cex.lab=0.7)
##
## Close graphics device
##
dev.off()
