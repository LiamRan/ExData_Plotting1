# The purpose of this script is to create a dataset called "rawdata". 

#Import the "household_power_consumption" zip file from the web
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileURL, temp)

# Create a temporary file for an unzipped file (house_power_consumption.txt).
unzip(temp)

# Create the "rawdata" dataset 
rawdata <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

# Change the factor values to numeric values.
rawdata$Global_active_power <- as.numeric(as.character(rawdata$Global_active_power))

# Convert the Date variable using as.Date
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")

# Subset the dataset so that it contains data for the dates 2007-02-01 and 2007-02-02
rawdata <- rawdata[((rawdata$Date == "2007-02-01") | (rawdata$Date == "2007-02-02")),]

# Create the "datetime" column to include the Date and Time values.
rawdata$datetime <- as.POSIXct(paste(as.character(rawdata$Date), rawdata$Time))
