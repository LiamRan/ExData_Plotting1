# This script creates a histogram of Global Active Power.

# If the "rawdata" dataset does not exist, the "Importing data.R" script is called to read the data and create the "rawdata" dataset.
if (!exists("rawdata")){
source("Importing data.R")
}

# Create Plot 1.
png("plot1.png", width = 480, height = 480)
hist(rawdata$Global_active_power, 
     main = "Global Active Power", 
     xaxt = 'n',
     xlab = "Global Active Power (kilowatts)", 
     ylim = c(0, 1200),
     ylab = "Frequency",
     breaks = 24,
     col = "red"
     )
axis(side = 1, at=seq(0, 6, by = 2), labels = seq(0, 6, by = 2))
dev.off()
