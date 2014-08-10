data<-read.table("./household_power_consumption.txt", sep=";",na.strings="?",header=TRUE)
newData<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
newData$Date <- as.Date(newData$Date, "%d/%m/%Y")
newData<-newData[complete.cases(newData),]
newData$Date <- as.POSIXct(paste(newData$Date,newData$Time), "%d/%m/%Y %H:%M:%S")

newData$Global_active_power<-as.character(newData$Global_active_power)
newData$Global_active_power<-as.numeric(newData$Global_active_power)
newData$Sub_metering_1<-as.character(newData$Sub_metering_1)
newData$Sub_metering_1<-as.numeric(newData$Sub_metering_1)
newData$Sub_metering_2<-as.character(newData$Sub_metering_2)
newData$Sub_metering_2<-as.numeric(newData$Sub_metering_2)
newData$Sub_metering_3<-as.character(newData$Sub_metering_3)
newData$Sub_metering_3<-as.numeric(newData$Sub_metering_3)

png(file="plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,1))
##1st plot
plot(newData$Date, newData$Global_active_power, xlab="", ylab="Global Active Power", type = "l")
##2nd plot
plot(newData$Date, newData$Voltage, xlab="datetime", ylab="Voltage", type = "l")
##3rd plot
plot(newData$Date, newData$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
lines(newData$Date, newData$Sub_metering_1, col = "black")
lines(newData$Date, newData$Sub_metering_2, col = "red")
lines(newData$Date, newData$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
##4th plot
plot(newData$Date, newData$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type = "l")

dev.off()