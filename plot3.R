#Reading in, subsetting and data conversion of the dataset
setwd("D:/R Directories/Coursera/Exploratory Data Analysis/Assignment 1")
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
subset <- subset(dataset, dataset$Date %in% c("1/2/2007", "2/2/2007"))
subset[,1] <- as.Date(subset[,1], format="%d/%m/%Y")

#Plot 3
png("plot3.png", width = 480, height = 480)
with(subset, {
      plot(Sub_metering_1 ~ Timedata, type = "l", xlab = "", ylab = "Energy sub metering")
      lines(Sub_metering_2 ~ Timedata, col = "Red")
      lines(Sub_metering_3 ~ Timedata, col = "Blue")})
legend("topright", col = c("Black", "Red", "Blue"), lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()