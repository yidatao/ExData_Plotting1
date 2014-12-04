#read only the "Date", "Time" and "Global_active_power" columns
d <- read.csv('household_power_consumption.txt',sep=';',na.strings="?",colClasses=c(NA, NA, "numeric", rep("NULL",6)))

#convert date
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

#subsetting data
data <- d[d$Date>="2007-02-01" & d$Date<="2007-02-02",]

#merge date and time to a new column "Date_Time"
data$Date_Time <- as.POSIXct(paste(data$Date, data$Time))

#save to file
png("plot2.png", height=480, width=480)

#plot
plot(data$Date_Time,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()