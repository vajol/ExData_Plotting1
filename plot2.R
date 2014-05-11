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
## Create new "Datetime" variable and add it to the "powerData" data set
##
x <- paste(powerData$Date, powerData$Time)
dt <- strptime(x, "%d/%m/%Y %H:%M:%S")
powerData <- cbind(powerData, dt)
head(powerData)
##
## Initialize graphics device
##
png(filename = "plot2.png",width=480, height=480)
##
## Create plot as shown in assignment
## Specify sign type, labels and size of a plot
##
plot(powerData$dt, powerData$Global_active_power, type = "l", ylab="Global Active Power (killowats)", xlab="",cex.axis=0.7,cex.lab=0.7)
##
## Close graphics device
##
dev.off()

