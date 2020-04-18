# This script creates a plot of Global Active Power over two-day period.

# If the "rawdata" dataset does not exist, the "Importing data.R" script is called to read the data and create the "rawdata" dataset.
if (!exists("rawdata")){
source("Importing data.R")
}

# Create Plot 2.
png("plot2.png", width = 480, height = 480)
plot(x = rawdata$datetime, y = rawdata$Global_active_power,
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()