
library(data.table)
house_data_header <- fread("household_power_consumption.txt", , nrows = 1, header = FALSE, sep = ";")
house_data <- fread("household_power_consumption.txt", skip = 66636, nrows = 2880, header = TRUE, sep = ";")
colnames(house_data) <- unlist(house_data_header)
house_data$Date <- as.Date(house_data$Date, "%d/%m/%Y")
png( filename = "plot4.png",width = 480,height = 480)
par(mfcol= c(2,2))
plot(strptime(paste(house_data$Date,house_data$Time), format="%Y-%m-%d %H:%M:%S"), house_data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type = "l")


plot(strptime(paste(house_data$Date,house_data$Time), format="%Y-%m-%d %H:%M:%S"), house_data$Sub_metering_1, ylab = "Energy sub metering", xlab="", type = "l")
lines(strptime(paste(house_data$Date,house_data$Time), format="%Y-%m-%d %H:%M:%S"), house_data$Sub_metering_2, col="RED")
lines(strptime(paste(house_data$Date,house_data$Time), format="%Y-%m-%d %H:%M:%S"), house_data$Sub_metering_3, col="BLUE")
legend("topright",lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","blue","red"),bty="n")

plot(strptime(paste(house_data$Date,house_data$Time), format="%Y-%m-%d %H:%M:%S"), house_data$Voltage, ylab = "Voltage", xlab="datetime", type = "l")

plot(strptime(paste(house_data$Date,house_data$Time), format="%Y-%m-%d %H:%M:%S"), house_data$Global_reactive_power, ylab = "Global_reactive_power", xlab="datetime", type = "l")

dev.off()