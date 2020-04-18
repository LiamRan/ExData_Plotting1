# This script creates a set of four plots:
#    1. Global Active Power over two-day period
#    2. Voltage over date and time
#    3. Energy sub metering over two-day period
#    4. Global reactive power over date and time

# If the "rawdata" dataset does not exist, the "Importing data.R" script is called to read the data and create the "rawdata" dataset.

if (!exists("rawdata")){
source("Importing data.R")
}

png("plot4.png", width = 480, height = 480)

# This creates 2 x 2 plot.
par(mfrow = c(2,2))

# This creates the first plot - Global Active Power over two-day period
# This plot is placed in the upper left section.
plot(x = rawdata$datetime, y = rawdata$Global_active_power,
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# This creates the second plot - Voltage over date and time
# This plot is placed in the upper right section.
plot(rawdata$datetime, rawdata$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# This creates the third plot - Energy sub metering over two-day period
# This plot is placed in the lower left section.
plot(rawdata$datetime, rawdata$Sub_metering_1, 
     type = "l", 
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")
lines(x = rawdata$datetime, y = rawdata$Sub_metering_2, col = "red")
lines(x = rawdata$datetime, y = rawdata$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black","blue","red"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1,
       bty = "n")

# This creates the fourth plot - Global reactive power over date and time
# This plot is placed in the lower right section.
plot(rawdata$datetime, rawdata$Global_reactive_power, 
       type = "l",
       xlab = "datetime",
       ylab = "Global_reactive_power"
       )
dev.off()

