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
png(filename = "plot4.png",width=480, height=480)
##
## Create matrix 2 x 2 of four plots
##
par(mfrow = c(2,2))
##
## Create first plot and set-up it's features
##
plot(powerData$dt, powerData$Global_active_power, type = "l", ylab="Global Active Power (killowats)", xlab="",cex.axis=0.7,cex.lab=0.7)
## Add second plot
plot(powerData$dt, powerData$Voltage, type = "l", ylab="Voltage", xlab="datetime",cex.axis=0.7,cex.lab=0.7)
## Add third plot
with(powerData, plot(powerData$dt, powerData$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="",cex.axis=0.7,cex.lab=0.7))
lines(powerData$dt, powerData$Sub_metering_2, type = "l", col = "red")
lines(powerData$dt, powerData$Sub_metering_3, type = "l", col = "blue")
legend("topright",bty = "n", lty=c(1,1,1), col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7)
## Add fourth plot
plot(powerData$dt, powerData$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime",cex.axis=0.7,cex.lab=0.7)
##
## Close graphics device
##
dev.off()