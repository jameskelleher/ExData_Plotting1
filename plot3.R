library(data.table)

data.all <- fread("household_power_consumption.txt", sep=";", na.strings = "?")
dt <- data.frame(subset(data.all, Date == "1/2/2007" | Date == "2/2/2007"))
dt$Datetime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

quartz()

with(dt, plot(Datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
par(col="red")
with(dt, lines(Datetime, Sub_metering_2))
par(col="blue")
with(dt, lines(Datetime, Sub_metering_3))

par(col="black")
legend("topright", seg.len=2, lwd=1, xjust=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png")
dev.off()