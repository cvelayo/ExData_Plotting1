# Read data into R with all columns as type "character"
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = "character")

# Convert Date field to subset required dates
x <- power$Date
d <- as.Date(x, "%d/%m/%Y")
power$Date <- d

# Create new dataframe with only required dates
power2 <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")

# Convert needed field to numeric
power2$Global_active_power <- as.numeric(power2$Global_active_power)

# Open png file device, create graph and close file device
par(bg = "transparent")
png(file="plot1.png", width = 480, height = 480)
hist(power2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()