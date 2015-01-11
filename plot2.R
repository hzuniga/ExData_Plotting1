#Read all the data
epc <- read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep=";")

#Read only 2 days data
epcdata <- subset(epc, Date=="1/2/2007" | Date=="2/2/2007")

#Convert Date/Time to date/time classes
epcdata$Date <- as.Date(epcdata[,1],"%d/%m/%Y")
DT <- paste(as.Date(epcdata$Date),epcdata$Time)
epcdata$DT <- as.POSIXct(DT)

#Create Plot2
plot(epcdata$Global_active_power ~ epcdata$DT,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Save plot to PNG file
dev.copy(png, file="plot2.png",width=480, height=480)
dev.off()
