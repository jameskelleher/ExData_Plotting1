library(data.table)

data.all <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
dt <- subset(data.all, Date == "1/2/2007" | Date == "2/2/2007")
dt$Datetime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

quartz()

with(dt, plot(dt$Datetime, dt$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png, "plot2.png")

dev.off()