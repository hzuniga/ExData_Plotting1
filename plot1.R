#Read all the data
epc <- read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep=";")

#Read only 2 days data
epcdata <- subset(epc, Date=="1/2/2007" | Date=="2/2/2007")

#Create Plot1
hist(epcdata[,3], col="red",main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")

#Save plot to PNG file
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()
