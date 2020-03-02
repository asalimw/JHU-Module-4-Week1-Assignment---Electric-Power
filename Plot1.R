#Load Data
data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Formate Date
data$date<-as.Date(data$Date, "%d/%m/%Y")

#Subset the required data from 2007-02-01 to 2007-02-02
requiredData <- subset(data, data$date >= "2007-02-01" & data$date <= "2007-02-02")

