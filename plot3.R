data<-read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                 na.strings="?", sep=";", header=T)
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time), "%F %H:%M:%S")
data2<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
png(file="plot3.png")
with(data2, plot(Time, Sub_metering_1, type="l", col="black",
                 xlab="", ylab="Energy sub metering"))
with(data2, lines(Time, Sub_metering_2, col="red"))
with(data2, lines(Time, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1)
dev.off()