# load data
data <- read.table("household_power_consumption.txt",sep =";", header = TRUE)
# filter data from  01/02/2007 to 02/02/2007
DATE1 <- as.Date("01/02/2007","%d/%m/%Y")
DATE2 <- as.Date("02/02/2007","%d/%m/%Y")
data[['Date']] <- as.Date(data[['Date']], "%d/%m/%Y")
data_1 <- data[data$Date >= DATE1 & data$Date <= DATE2,]
# convert character to numeric
data_1[['Global_active_power']] <- as.numeric(data_1$Global_active_power)
data_1[['Voltage']] <- as.numeric(data_1$Voltage)
data_1[['Sub_metering_1']] <- as.numeric(data_1$Sub_metering_1)
data_1[['Sub_metering_2']] <- as.numeric(data_1$Sub_metering_2)
data_1[['Sub_metering_3']] <- as.numeric(data_1$Sub_metering_3)
data_1[['Global_reactive_power']] <- as.numeric(data_1$Global_reactive_power)
# extract datetime
data_1$datetime<-as.POSIXct(paste(data_1$Date, data_1$Time), format="%Y-%m-%d %H:%M:%S")
library(stats)
library(dplyr)
data_1$datetime<-as_datetime(data_1[["datetime"]])
# plot and save file png
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# chart 1:Global Active Power
plot(data_1$Global_active_power~data_1$datetime, type='l', 
     xlab = "", ylab="Global Active Power" )
# chart 2:Voltage
plot(data_1$Voltage~data_1$datetime, type='l', 
     xlab = "datetime", ylab="Voltage" )
#chart 3: Energy sub etering
plot(data_1$Sub_metering_1~data_1$datetime, type='l', col='purple',
     xlab = "", ylab="Energy sub etering" )
lines(data_1$Sub_metering_2~data_1$datetime, type='l', col='red',
     xlab = "", ylab="Energy sub etering" )
lines(data_1$Sub_metering_3~data_1$datetime, type='l', col='blue',
     xlab = "", ylab="Energy sub etering" )
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       col =c('purple','red','blue'), lwd = 1.5)
# chart 4: Global Reactive Power
plot(data_1$Global_reactive_power~data_1$datetime, type='l', 
     xlab = "datetime", ylab="Global Reactive Power" )
dev.off()

