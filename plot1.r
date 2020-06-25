# Reading, naming and subsetting power consumption data
png(file="Plot1.png", height=480, width=480)
power <- data.table::fread("household_power_consumption.txt")
d<-as.Date(power$Date, "%d/%m/%Y")
subpower<-subset(power, d>= "2007-02-01" & d<= "2007-02-02")

#subtime <- paste(as.Date(subpower$Date, format = "%d/%m/%Y"), subpower$Time)
#time <- as.POSIXct(subtime)

hist(as.numeric(subpower$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.off()


