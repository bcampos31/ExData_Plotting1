## Getting Dataset
plot2_raw <- read.csv("household_power_consumption.txt", header = T, sep=';', na.strings="?", nrows=2075259, check.names=F, comment.char="", quote='\"')

## Format the date to dd/mm/yyyy
plot2_raw$Date <- as.Date(plot2_raw$Date, format="%d/%m/%Y")

## Select data in pwcons
plot2 <- subset(plot2_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Paste Date & time in and only column for print in the plot.
datetime <- paste(as.Date(plot2$Date), plot2$Time)
plot2$Datetime <- as.POSIXct(datetime)

## Plot 2 & saving a png file
plot(plot2$Global_active_power~plot2$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="") ## Print the plot in the format wished
dev.copy(png, file="plot2.png", height=480, width=480) ## Save the plot in a png file
dev.off() ## close the png device

