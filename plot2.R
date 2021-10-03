# load data
data <- read.table("household_power_consumption.txt",sep =";", header = TRUE)
# filter data from  01/02/2007 to 02/02/2007
DATE1 <- as.Date("01/02/2007","%d/%m/%Y")
DATE2 <- as.Date("02/02/2007","%d/%m/%Y")
data[['Date']] <- as.Date(data[['Date']], "%d/%m/%Y")
data_1 <- data[data$Date >= DATE1 & data$Date <= DATE2,]
# convert character to numeric
data_1[['Global_active_power']] <- as.numeric(data_1$Global_active_power)
# extract datetime
data_1$datetime<-as.POSIXct(paste(data_1$Date, data_1$Time), format="%Y-%m-%d %H:%M:%S")
library(stats)
library(dplyr)
data_1$datetime<-as_datetime(data_1[["datetime"]])
# plot and save file png
png(file = "plot2.png", width = 480, height = 480)
plot(data_1$Global_active_power~data_1$datetime, type='l', 
     xlab = "", ylab="Global Active Power (kilowatts)" )
dev.off()