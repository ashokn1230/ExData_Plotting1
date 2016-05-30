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
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

#plot3
with(data, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", type = "n" ))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", 
       lty = 1,  
       col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#copy to PNG file
dev.copy(png, file="plot3.png",  width = 480, height = 480)
dev.off()