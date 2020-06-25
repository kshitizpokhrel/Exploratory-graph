# Reading, naming and subsetting power consumption data
png(file="Plot4.png", height=480, width=480)
power <- data.table::fread("household_power_consumption.txt")
#names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
d<-as.Date(power$Date, "%d/%m/%Y")
subpower<-subset(power, d>= "2007-02-01" & d<= "2007-02-02")

subtime <- paste(as.Date(subpower$Date, format = "%d/%m/%Y"), subpower$Time)
time <- as.POSIXct(subtime)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(subpower, {
  plot(time,as.numeric(subpower$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")

  plot(time, as.numeric(subpower$Voltage), xlab = "datetime", ylab = "voltage", type = "l")

  plot(time, as.numeric(subpower$Sub_metering_1), type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering")
  lines(time, as.numeric(subpower$Sub_metering_2), col = "red")
  lines(time, as.numeric(subpower$Sub_metering_3), col = "blue")

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1",
                                                                                 "Sub_metering_2",
                                                                                 "Sub_metering_3"))
plot(time, as.numeric(subpower$Global_reactive_power), xlab = "datetime", type = "l", ylab = "Global_Reactive_Power")
})

dev.off()
