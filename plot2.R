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

# Plotting the Global Active Power and saving it to plot2.png
png("plot2.png", width = 480, height = 480)
plot(x=data$DateTime, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()