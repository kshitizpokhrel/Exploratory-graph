# Reading, naming and subsetting power consumption data
png(file="Plot3.png", height=480, width=480)
power <- data.table::fread("household_power_consumption.txt")
#names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
d<-as.Date(power$Date, "%d/%m/%Y")
subpower<-subset(power, d>= "2007-02-01" & d<= "2007-02-02")

subtime <- paste(as.Date(subpower$Date, format = "%d/%m/%Y"), subpower$Time)
time <- as.POSIXct(subtime)

with(subpower,{plot(time, as.numeric(subpower$Sub_metering_1), type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering")
     lines(time, as.numeric(subpower$Sub_metering_2), col = "red")
     lines(time, as.numeric(subpower$Sub_metering_3), col = "blue")})
     
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1",
                                                                                "Sub_metering_2",
                                                                                "Sub_metering_3"))
dev.off()

