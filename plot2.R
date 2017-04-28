#Reading in, subsetting and data conversion of the dataset
setwd("D:/R Directories/Coursera/Exploratory Data Analysis/Assignment 1")
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
subset <- subset(dataset, dataset$Date %in% c("1/2/2007", "2/2/2007"))
subset[,1] <- as.Date(subset[,1], format="%d/%m/%Y")

#Plot 2
subset$Timedata <- as.POSIXct(paste(subset$Date, subset$Time))
png("plot2.png", width = 480, height = 480)
plot(subset$Global_active_power ~ subset$Timedata, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()