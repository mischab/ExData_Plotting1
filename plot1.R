
library(data.table)
house_data_header <- fread("household_power_consumption.txt", , nrows = 1, header = FALSE, sep = ";")
house_data <- fread("household_power_consumption.txt", skip = 66636, nrows = 2880, header = TRUE, sep = ";")
colnames(house_data) <- unlist(house_data_header)
png( filename = "plot1.png",width = 480,height = 480)
hist(house_data$Global_active_power, xlab = "Global Active Power (kilowatts)", main ="Global Active Power", col = "RED")
dev.off()


