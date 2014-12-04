#read the entire data
d <- read.csv('household_power_consumption.txt',sep=';',na.strings="?")

#convert date
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

#subsetting data
data <- d[d$Date>="2007-02-01" & d$Date<="2007-02-02",]

#merge date and time to a new column "Date_Time"
data$Date_Time <- as.POSIXct(paste(data$Date, data$Time))

#save to file
png("plot4.png", height=480, width=480)

#set the layout
par(mfrow = c(2,2))

#plot1
plot(data$Date_Time,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")

#plot2
plot(data$Date_Time,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot3
plot(data$Date_Time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Date_Time,data$Sub_metering_2,col="red")
lines(data$Date_Time,data$Sub_metering_3,col="blue")
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
plot(data$Date_Time,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()