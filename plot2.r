# Reading, naming and subsetting power consumption data
png(file="Plot1.png", height=480, width=480)
power <- data.table::fread("household_power_consumption.txt")
#names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
d<-as.Date(power$Date, "%d/%m/%Y")
subpower<-subset(power, d>= "2007-02-01" & d<= "2007-02-02")

subtime <- paste(as.Date(subpower$Date, format = "%d/%m/%Y"), subpower$Time)
time <- as.POSIXct(subtime)

# calling the basic plot function
plot(time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")
dev.off()
