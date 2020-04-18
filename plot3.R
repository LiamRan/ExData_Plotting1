# This script creates a plot of Energy sub metering over two-day period.

# If the "rawdata" dataset does not exist, the "Importing data.R" script is called to read the data and create the "rawdata" dataset.
if (!exists("rawdata")){
source("Importing data.R")
}

# Create Plot 3.
png("plot3.png", width = 480, height = 480)
plot(x = rawdata$datetime, y = rawdata$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering", 
     col = "black")
lines(rawdata$datetime, rawdata$Sub_metering_2, col = "red")
lines(rawdata$datetime, rawdata$Sub_metering_3, col = "blue")
legend("topright",
       col = c("black","blue","red"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1)
dev.off()
