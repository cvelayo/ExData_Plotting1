# Read data into R with all columns as type "character"
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = "character")

# Convert Date field to subset required dates, and create new time column to plot data by minute
y <- power$Time
x <- power$Date
z <- paste(x,y)
t <- strptime(z, "%d/%m/%Y %H:%M:%S")
power <- cbind (power,t)
d <- as.Date(x, "%d/%m/%Y")
power$Date <- d

# Create new dataframe with only required dates
power2 <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")

# Convert needed fields to numeric
power2$Global_active_power <- as.numeric(power2$Global_active_power)
power2$Sub_metering_1 <- as.numeric(power2$Sub_metering_1)
power2$Sub_metering_2 <- as.numeric(power2$Sub_metering_2)
power2$Sub_metering_3 <- as.numeric(power2$Sub_metering_3)

# Open png file device, create graph, using type "n" to overlay different columns and close file device
png(file="plot3.png", width = 480, height = 480)
plot(power2$t, power2$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
lines(power2$t,power2$Sub_metering_1, col="black")
lines(power2$t,power2$Sub_metering_2, col="red")
lines(power2$t,power2$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), text.col = "black")
dev.off()
