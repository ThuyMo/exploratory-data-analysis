# load data
data <- read.table("household_power_consumption.txt",sep =";", header = TRUE)
# filter data from  01/02/2007 to 02/02/2007
DATE1 <- as.Date("01/02/2007","%d/%m/%Y")
DATE2 <- as.Date("02/02/2007","%d/%m/%Y")
data[['Date']] <- as.Date(data[['Date']], "%d/%m/%Y")
data_1 <- data[data$Date >= DATE1 & data$Date <= DATE2,]
# convert character to numeric
data_1[['Sub_metering_1']] <- as.numeric(data_1$Sub_metering_1)
data_1[['Sub_metering_2']] <- as.numeric(data_1$Sub_metering_2)
data_1[['Sub_metering_3']] <- as.numeric(data_1$Sub_metering_3)
# extract datetime
data_1$datetime<-as.POSIXct(paste(data_1$Date, data_1$Time), format="%Y-%m-%d %H:%M:%S")
library(stats)
library(dplyr)
data_1$datetime<-as_datetime(data_1[["datetime"]])
# plot and save file png
png(file = "plot3.png", width = 480, height = 480)
plot(data_1$Sub_metering_1~data_1$datetime, type='l', col='purple',
     xlab = "", ylab="Energy sub etering" )
lines(data_1$Sub_metering_2~data_1$datetime, type='l', col='red',
     xlab = "", ylab="Energy sub etering" )
lines(data_1$Sub_metering_3~data_1$datetime, type='l', col='blue',
     xlab = "", ylab="Energy sub etering" )
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       col =c('purple','red','blue'), lwd = 1.5)
dev.off()
