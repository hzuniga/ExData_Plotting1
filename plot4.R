#Read all the data
epc <- read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep=";")

#Read only 2 days data
epcdata <- subset(epc, Date=="1/2/2007" | Date=="2/2/2007")

#Convert Date/Time to date/time classes
epcdata$Date <- as.Date(epcdata[,1],"%d/%m/%Y")
DT <- paste(as.Date(epcdata$Date),epcdata$Time)
epcdata$DT <- as.POSIXct(DT)

#Create Plot4
par(mfrow=c(2,2))
plot(epcdata$Global_active_power ~ epcdata$DT,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(epcdata$Voltage ~ epcdata$DT,type="l",xlab="datetime",ylab="Voltage")
plot(epcdata$Sub_metering_1 ~ epcdata$DT,type="l",ylab="Energy sub metering",xlab="")
points(epcdata$Sub_metering_2 ~ epcdata$DT, col="red", type="l")
points(epcdata$Sub_metering_3 ~ epcdata$DT, col="blue",type="l")
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(epcdata$Global_reactive_power ~ epcdata$DT,type="l",xlab="datetime",ylab="Global_reactive_power")


#Save plot to PNG file
dev.copy(png, file="plot4.png",width=480, height=480)
dev.off()