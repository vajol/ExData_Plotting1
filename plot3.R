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
png(filename = "plot3.png",width=480, height=480)
##
## Create plot as shown in assignment
## Specify sign type, labels and size of a plot, color of plots and legend
##
with(powerData, plot(powerData$dt, powerData$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="",cex.axis=0.7,cex.lab=0.7))
lines(powerData$dt, powerData$Sub_metering_2, type = "l", col = "red")
lines(powerData$dt, powerData$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7)
##
## Close graphics device
##
dev.off()