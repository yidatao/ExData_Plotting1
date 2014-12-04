#read only the "Date", "Time" and sub metering columns
d <- read.csv('household_power_consumption.txt',sep=';',na.strings="?",colClasses=c(NA, NA, rep("NULL",4),rep("numeric",3)))

#convert date
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

#subsetting data
data <- d[d$Date>="2007-02-01" & d$Date<="2007-02-02",]

#merge date and time to a new column "Date_Time"
data$Date_Time <- as.POSIXct(paste(data$Date, data$Time))

#plot and save to file
png("plot3.png", height=480, width=480)

plot(data$Date_Time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Date_Time,data$Sub_metering_2,col="red")
lines(data$Date_Time,data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()