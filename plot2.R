
library(data.table)
house_data_header <- fread("household_power_consumption.txt", , nrows = 1, header = FALSE, sep = ";")
house_data <- fread("household_power_consumption.txt", skip = 66636, nrows = 2880, header = TRUE, sep = ";")
colnames(house_data) <- unlist(house_data_header)
house_data$Date <- as.Date(house_data$Date, "%d/%m/%Y")
png( filename = "plot2.png",width = 480,height = 480)
plot(strptime(paste(house_data$Date,house_data$Time), format="%Y-%m-%d %H:%M:%S"), house_data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type = "l")

dev.off()
