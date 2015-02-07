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


## Plot 4
png("plot4.png", width=480, height=480)

## partition into 2x2 matrix
par(mfrow=c(2,2))

# first plot
plot(plotdata$DateTime,plotdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")
# second plot
plot(plotdata$DateTime,plotdata$Voltage,type="l",xlab="datetime",ylab="Voltage")
# third plot
plot(plotdata$DateTime,plotdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plotdata$DateTime,plotdata$Sub_metering_2, type="l", col="red")
lines(plotdata$DateTime,plotdata$Sub_metering_3, type="l", col="blue")
legend('topright', names(plotdata)[7:9], lty=1, col=c("black","red", "blue"), bty='n')
#fourth plot
plot(plotdata$DateTime,plotdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off() 


