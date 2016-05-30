#Reading Data
data <- read.csv("household_power_consumption.txt", sep=";")

#Converting date datatype
library(lubridate)
data$Date <- dmy(data$Date)
#subsetting 2 days of data
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02" )

#create datetime column for x axis
data$datetime <- with(data , paste(Date, Time))
data$datetime <- ymd_hms(data$datetime)

#converting to numeric datatype
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

#plot4
par(mfrow = c(2,2))
with(data, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l" ))
      
with(data, plot(datetime, Voltage, ylab = "Voltage", type = "l" ))

with(data, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", type = "n" ))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", 
       lty = c(1,1,1),  
       col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex = 0.6)

with(data, plot(datetime, Global_reactive_power, ylab = "Global_reactive_power", type = "l" ))


#copy to PNG file
dev.copy(png, file="plot4.png",  width = 480, height = 480)
dev.off()