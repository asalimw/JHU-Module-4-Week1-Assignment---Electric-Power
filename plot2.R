#Load Data
data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Formate Date
data$date<-as.Date(data$Date, "%d/%m/%Y")

#Subset the required data from 2007-02-01 to 2007-02-02
requiredData <- subset(data, data$date >= "2007-02-01" & data$date <= "2007-02-02")

requiredData$Date <- as.Date(requiredData$Date, format="%d/%m/%Y")
datetime <-paste(as.Date(requiredData$Date), requiredData$Time)
requiredData$Datetime <- as.POSIXct(datetime)

## Plot 2
with(requiredData, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
#Turn off the screen if it is no longer in use
dev.off()
