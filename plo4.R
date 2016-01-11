## Format the date to dd/mm/yyyy
plot4_raw$Date <- as.Date(plot4_raw$Date, format="%d/%m/%Y")

## Select data in pwcons
plot4 <- subset(plot4_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Paste Date & time in and only column for print in the plot.
datetime <- paste(as.Date(plot4$Date), plot4$Time)
plot4$Datetime <- as.POSIXct(datetime)

## Plot 4 & saving a png file
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plot4, {
	plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
	plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
	plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
	lines(Sub_metering_2~Datetime, col="red")
	lines(Sub_metering_3~Datetime, col="blue")
	legend("topright", col=c("black","red","blue"),lty=1,lwd=2, bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(Global_reactive_power~Datetime, type="l", ylab="Global Reactive Power (kilowatts)",xlab="")
	}
)

dev.copy(png, file="plot4.png", height=480, width=480) ## Save the plot in a png file
dev.off() ## close the png device
