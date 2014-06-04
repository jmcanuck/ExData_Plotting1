#hello world

bd<-read.csv("household_power_consumption.txt",sep=";",colClasses=c(rep("character",9)))

bd$DT<-strptime(paste(bd$Date,bd$Time),format='%d/%m/%Y %T')
bd$Date<-as.Date(bd$Date,format="%d/%m/%Y")
bd$Global_active_power<-as.numeric(bd$Global_active_power)
bd$Global_reactive_power<-as.numeric(bd$Global_reactive_power)
bd$Voltage<-as.numeric(bd$Voltage)
bd$Global_intensity<-as.numeric(bd$Global_intensity)
bd$Sub_metering_1<-as.numeric(bd$Sub_metering_1)
bd$Sub_metering_2<-as.numeric(bd$Sub_metering_2)
bd$Sub_metering_3<-as.numeric(bd$Sub_metering_3)

 
sd<-bd[bd$Date==as.Date('2007-02-01') | bd$Date==as.Date('2007-02-02'),]


##plots
hist(sd$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")  <- #1
plot(sd$DT,sd$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")  <- #2

#3 \/
nr<-nrow(sd)
tick<-nr/2
gmax<-max(max(sd$Sub_metering_1),max(sd$Sub_metering_2),max(sd$Sub_metering_3))
ytick<-round(gmax,-1)/4
plot(sd$Sub_metering_1,type="l",col="black",axes=FALSE,ann=FALSE)
lines(sd$Sub_metering_2,type="l",col="red")
lines(sd$Sub_metering_3,type="l",col="blue")
axis(1,at=c(0,tick,nr),lab=c("Thu","Fri","Sat"))
axis(2,las=1,at=ytick*0:3)
title(ylab="Energy sub metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, col=c("black","red","blue"), lty=c(1,1,1), lwd=2)
box()

#4
par(mfrow=c(2,2))

hist(sd$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

plot(sd$DT,sd$Voltage,type="l",xlab="datetime",ylab="Voltage")

nr<-nrow(sd)
tick<-nr/2
gmax<-max(max(sd$Sub_metering_1),max(sd$Sub_metering_2),max(sd$Sub_metering_3))
ytick<-round(gmax,-1)/4
plot(sd$Sub_metering_1,type="l",col="black",axes=FALSE,ann=FALSE)
lines(sd$Sub_metering_2,type="l",col="red")
lines(sd$Sub_metering_3,type="l",col="blue")
axis(1,at=c(0,tick,nr),lab=c("Thu","Fri","Sat"))
axis(2,las=1,at=ytick*0:3)
title(ylab="Energy sub metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, col=c("black","red","blue"), lty=c(1,1,1), lwd=2)
box()

plot(sd$DT,sd$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")






the other plots
plot(sd$DT,sd$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(sd$DT,sd$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
