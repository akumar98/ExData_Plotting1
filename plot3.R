##Read the Txt file
powerconsumption <- read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, dec=".", header=TRUE)

##Create a subset with only days "1/2/2007" and "2/2/2007"
powersubset<-powerconsumption[powerconsumption$Date %in% c("1/2/2007", "2/2/2007"),]

##Create Date with Time Object
##Create a Vector with data from globalActivepower column, subMeter1, subMeter2, subMeter3
datewithtime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(powersubset$Global_active_power)
subMeter1 <- as.numeric(powersubset$Sub_metering_1)
subMeter2 <- as.numeric(powersubset$Sub_metering_2)
subMeter3 <- as.numeric(powersubset$Sub_metering_3)

##Open the png device and plot the graph
png("plot3.png", width=480, height=480)
plot(datewithtime, subMeter1, type="l", xlab="", ylab="Energy Submetering")
lines(datewithtime, subMeter2, type="l", col="red")
lines(datewithtime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Close the png device to generate the plot. 
dev.off()