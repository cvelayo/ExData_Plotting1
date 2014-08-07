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

# Convert needed field to numeric
power2$Global_active_power <- as.numeric(power2$Global_active_power)

# Open png file device, create graph and close file device
png(file="plot2.png", width = 480, height = 480)
plot(power2$t, power2$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
