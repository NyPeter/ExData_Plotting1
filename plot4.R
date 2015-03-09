data<-read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", na.strings="?", sep=";", header=T)
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time), "%F %H:%M:%S")
data2<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
png(file="plot4.png")
par(mfcol=c(2,2))
with(data2, {
    plot(Time, Global_active_power, type="l",
         xlab="", ylab="Global Active Power (kilowatts)")
    plot(Time, Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright", col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lwd=1, bty="n")
    plot(Time, Voltage, type="l", xlab="datetime")
    plot(Time, Global_reactive_power, xlab="datetime", type="l")
})
dev.off()