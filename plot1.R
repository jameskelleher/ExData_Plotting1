library(data.table)

data.all <- fread("household_power_consumption.txt", sep=";", na.strings = "?")
dt <- subset(data.all, Date == "1/2/2007" | Date == "2/2/2007")
dt$Date <- as.IDate(as.Date(dt$Date, "%m/%d/%Y"))
dt$Time <- as.ITime(strptime(dt$Time, "%H:%M:%S"))

quartz()
hist(dt$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
