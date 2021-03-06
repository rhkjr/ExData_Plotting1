# plot4.R

# Assumes data was downloaded to working directory and unzipped there
# data file is therefore in "./exdata-data-household_power_consumption/household_power_consumption.txt"

#  Read data only from 2007-02-01 and 2007-02-02
#   having queried the fully loaded file, these are lines 66637 to 69516, 2880 total rows


inPath <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
inDF <- read.table(inPath, header=TRUE, stringsAsFactors = FALSE, sep=";", skip=66636, nrows=2880)
names(inDF) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


png("plot4.png", width = 480, height = 480, units = "px")

inDF$Date <- as.POSIXct(paste(inDF$Date, inDF$Time), format="%d/%m/%Y %H:%M:%S")


par(mfrow=c(2,2))

# graph 1
plot(inDF$Date, inDF$Global_active_power, type="l",xlab="",ylab="Global Active Power",main="")

# graph 2
plot(inDF$Date, inDF$Voltage, type="l",xlab="datetime",ylab="Voltage",main="")

# graph 3
plot(inDF$Date,inDF$Sub_metering_1, xlab="",ylab="Energy sub metering",main="", type="n")
points(inDF$Date,inDF$Sub_metering_1, type="l", col="black")
points(inDF$Date,inDF$Sub_metering_2, type="l", col="red")
points(inDF$Date,inDF$Sub_metering_3, type="l", col="blue")
legend("topright",col=c("black","red","blue"),lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

# graph 4
plot(inDF$Date, inDF$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power",main="")


dev.off()

