# Loading the household power consumpition data into a variable called "data"
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")

# Converting char formats to appropriate date and time formats
data$DateTime <- paste (data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subsettig data
data <- subset(data, data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"))

# Setting locale to default (english)
Sys.setlocale(category = "LC_TIME", locale = "C")

#Plotting 4 graphs on energy consumtion on a 2x2 canvas and saving in to plot4.png
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(x=data$DateTime, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(x=data$DateTime, y=data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x=data$DateTime, y=data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(x=data$DateTime, y=data$Sub_metering_2, col="red")
lines(x=data$DateTime, y=data$Sub_metering_3, col="blue")
legend("topright", legend=c(colnames(data[7]), colnames(data[8]), colnames(data[9])), col=c("black", "red", "blue"), lwd=1, lty=c(1,1))

plot(x=data$DateTime, y=data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()