# Loading the household power consumpition data into a variable called "data"
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")

# Converting char formats to appropriate date and time formats
data$DateTime <- paste (data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subsettig data
data <- subset(data, data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"))

# Plotting a histogram on Global Active Power and saving it to plot1.png
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()