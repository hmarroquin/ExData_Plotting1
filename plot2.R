##Author: hmarroquin
##Date  : 2015-02-06
##Notes : Ensure the file household_power_consumption.txt is found in your working directory.


## Load required packages:
install.packages("sqldf")
library("sqldf")


## Construct FileName:
filename <- paste(getwd(),"/household_power_consumption.txt",sep="")

## Read required data:
plotdata <- read.csv.sql(filename, sql = 'select * from file where Date IN ("1/2/2007","2/2/2007")',header = TRUE, sep = ";")


## Add Datetime column to dataset:
plotdata$DateTime <- strptime(paste(plotdata$Date, plotdata$Time) , "%d/%m/%Y %H:%M:%S")


## Plot 2
png("plot2.png", width=480, height=480)
plot(plotdata$DateTime,plotdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()