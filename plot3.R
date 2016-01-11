## Getting Dataset
plot3_raw <- read.csv("household_power_consumption.txt", header = T, sep=';', na.strings="?", nrows=2075259, check.names=F, comment.char="", quote='\"')

## Format the date to dd/mm/yyyy
plot3_raw$Date <- as.Date(plot3_raw$Date, format="%d/%m/%Y")

## Select data in pwcons
plot3 <- subset(plot3_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Paste Date & time in and only column for print in the plot.
datetime <- paste(as.Date(plot3$Date), plot3$Time)
plot3$Datetime <- as.POSIXct(datetime)

## Plot 3 & saving a png file
with (plot3, {
	plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
	lines(Sub_metering_2~Datetime,col="red")
	lines(Sub_metering_3~Datetime,col="blue")
	}
	)
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480) ## Save the plot in a png file
dev.off() ## close the png device
