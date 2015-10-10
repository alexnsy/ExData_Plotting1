##Read the data file
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings = "?")

## Subset the data to only data for the dates of interest 1/2/007 and 2/2/2007
selectdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Format the Date
as.Date(selectdata$Date, format = "%d/%m/%Y")

## Format the Time as a combination of Date and Time
selectdata$Time <- strptime(paste(selectdata$Date, selectdata$Time), "%d/%m/%Y %H:%M:%S")

## Set to plot to a png file
png("plot3.png", width = 480, height = 480)

## Plot the Sub Metering 1/2/3 vs Date/Time
plot(selectdata$Time, selectdata$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")

lines(selectdata$Time, selectdata$Sub_metering_1)
lines(selectdata$Time, selectdata$Sub_metering_2,col="red")
lines(selectdata$Time, selectdata$Sub_metering_3,col="blue")

## Create the legend at the topright corner
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=c(1,1,1))

## Close the graphics device
dev.off()