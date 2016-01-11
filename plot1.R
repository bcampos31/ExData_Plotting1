## Getting Dataset
plot1_raw <- read.csv("household_power_consumption.txt", header = T, sep=';', na.strings="?", nrows=2075259, check.names=F, comment.char="", quote='\"')

## Format the date to dd/mm/yyyy
plot1_raw$Date <- as.Date(plot1_raw$Date, format="%d/%m/%Y")

## Select data in pwcons
plot1 <- subset(plot1_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot 1 & copy un png file
hist(plot1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") ## plot in an histograme the plot
dev.copy(png, file="plot1.png", height=480, width=480) ## Copy the plot in a png file with dimensions 480x480
dev.off() ##close the png device
