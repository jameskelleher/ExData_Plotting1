library(data.table)

data.all <- fread("household_power_consumption.txt", sep=";", na.strings = "?")
dt <- data.frame(subset(data.all, Date == "1/2/2007" | Date == "2/2/2007"))
dt$Datetime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")

quartz()

par(mfrow=c(2,2), col="black")
with(dt, {
  plot(Datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  plot(Datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(Datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  par(col="red")
  lines(Datetime, Sub_metering_2)
  par(col="blue")
  lines(Datetime, Sub_metering_3)
  par(col="black")
  legend("topright", bty="n", inset=c(.15, 0), seg.len=2, lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

dev.copy(png, "plot4.png")
dev.off()