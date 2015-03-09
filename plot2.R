data<-read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                 na.strings="?", sep=";", header=T)
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time), "%F %H:%M:%S")
data2<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
png(file="plot2.png")
with(data2, plot(Time, Global_active_power, type="l",
                 xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()