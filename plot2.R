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

#convert Global_active_power to numeric datatype
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#plot2
with(data, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l" ))

#copy to PNG file
dev.copy(png, file="plot2.png",  width = 480, height = 480)
dev.off()