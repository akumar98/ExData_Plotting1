##Read the Txt file
powerconsumption <- read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, dec=".", header=TRUE)
##Create a subset with only days "1/2/2007" and "2/2/2007"
powersubset<-powerconsumption[powerconsumption$Date %in% c("1/2/2007", "2/2/2007"),]
##Create Date with Time Object
##Create a Vector with data from globalActivepower column
datewithtime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(powersubset$Global_active_power)
##Open the png device and plot the graph
png("plot2.png", width=480, height=480)
plot(datewithtime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##Close the png device to generate the plot. 
dev.off()