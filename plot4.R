#Reading in, subsetting and manipulation of the dataset
setwd("D:/R Directories/Coursera/Exploratory Data Analysis/Assignment 1")
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
subset <- subset(dataset, dataset$Date %in% c("1/2/2007", "2/2/2007"))
subset[,1] <- as.Date(subset[,1], format="%d/%m/%Y")
subset$Timedata <- as.POSIXct(paste(subset$Date, subset$Time))

#Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subset, {
      plot(Global_active_power ~ Timedata, type = "l", xlab = "", ylab = "Global Active Power")
      plot(Voltage ~ Timedata, type = "l", xlab = "datetime")
      plot(Sub_metering_1 ~ Timedata, type = "l", xlab = "", ylab = "Energy sub metering")
      lines(Sub_metering_2 ~ Timedata, col = "Red")
      lines(Sub_metering_3 ~ Timedata, col = "Blue")
      legend("topright", col = c("Black", "Red", "Blue"), lty = 1, lwd = 1, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(Global_reactive_power ~ Timedata, type = "l", xlab = "datetime")})
dev.off()