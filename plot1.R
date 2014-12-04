#read only the "Date" and "Global_active_power" columns
d <- read.csv('household_power_consumption.txt',sep=';',na.strings="?",colClasses=c(NA, "NULL", "numeric", rep("NULL",6)))

#convert date
d$Date <- as.Date(d$Date, format="%d/%m/%Y")

#subsetting data
data <- d[d$Date>="2007-02-01" & d$Date<="2007-02-02",]

#plot
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")

#save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()