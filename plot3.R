#Load Data
data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Formate Date
data$date<-as.Date(data$Date, "%d/%m/%Y")

#Subset the required data from 2007-02-01 to 2007-02-02
requiredData <- subset(data, data$date >= "2007-02-01" & data$date <= "2007-02-02")

requiredData$Date <- as.Date(requiredData$Date, format="%d/%m/%Y")
datetime <-paste(as.Date(requiredData$Date), requiredData$Time)
requiredData$Datetime <- as.POSIXct(datetime)

## Plot 3
with(requiredData, {
  +   plot(Sub_metering_1~Datetime, type="l",
           +        ylab="Global Active Power (kilowatts)", xlab="")
  +   lines(Sub_metering_2~Datetime,col='Red')
  +   lines(Sub_metering_3~Datetime,col='Blue')
  + })

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Saving plot3 png file
dev.copy(png, file="plot3.png", height=480, width=480)

#Swith off device
dev.off()
