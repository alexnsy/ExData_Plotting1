##Read the data file
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings = "?")

## Subset the data to only data for the dates of interest 1/2/007 and 2/2/2007
selectdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Format the Date
as.Date(selectdata$Date, format = "%d/%m/%Y")

## Format the Time as a combination of Date and Time
selectdata$Time <- strptime(paste(selectdata$Date, selectdata$Time), "%d/%m/%Y %H:%M:%S")

## Set to plot to a png file
png("plot1.png", width = 480, height = 480)

## Plot the Global Active Power histogram
hist(newdata$Global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Close the graphics device
dev.off()