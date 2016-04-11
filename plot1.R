# plot1.R

# Assumes data was downloaded to working directory and unzipped there
# data file is therefore in "./exdata-data-household_power_consumption/household_power_consumption.txt"

#  Read data only from 2007-02-01 and 2007-02-02
#   having queried the fully loaded file, these are lines 66637 to 69516, 2880 total rows


inPath <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
inDF <- read.table(inPath, header=TRUE, stringsAsFactors = FALSE, sep=";", skip=66636, nrows=2880)
names(inDF) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

png("plot1.png", width = 480, height = 480, units = "px")
hist(inDF$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

