##Read the Txt file
powerconsumption <- read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, dec=".", header=TRUE)
##Create a subset with only days "1/2/2007" and "2/2/2007"
powersubset<-powerconsumption[powerconsumption$Date %in% c("1/2/2007", "2/2/2007"),]
##Create a Vector with data from globalActivepower column
globalActivePower <- as.numeric(powersubset$Global_active_power)
##Open the png device and plot the graph
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
##Close the png device to generate the plot. 
dev.off()