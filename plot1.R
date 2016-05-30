#Reading Data
data <- read.csv("household_power_consumption.txt", sep=";")

#Converting datatypes
library(lubridate)
data$Date <- dmy(data$Date)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#subsetting 2 days of data
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02" )

#plot1
with(data, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red"))

#copy to PNG file
dev.copy(png, file="plot1.png",  width = 480, height = 480)
dev.off()