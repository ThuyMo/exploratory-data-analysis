# load data
data <- read.table("household_power_consumption.txt",sep =";", header = TRUE)
# filter data from  01/02/2007 to 02/02/2007
DATE1 <- as.Date("01/02/2007","%d/%m/%Y")
DATE2 <- as.Date("02/02/2007","%d/%m/%Y")
data[['Date']] <- as.Date(data[['Date']], "%d/%m/%Y")
data_1 <- data[data$Date >= DATE1 & data$Date <= DATE2,]
# convert character to numeric
data_1[['Global_active_power']] <- as.numeric(data_1$Global_active_power)
# plot and save file png
png(file = "plot1.png", width = 480, height = 480)
hist(data_1$Global_active_power[Global_active_power<=6], 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     border="black", 
     col="red")
dev.off()