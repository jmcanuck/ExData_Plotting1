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
hist(sd$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Title")  <- not quite
plot(sd$DT,sd$Global_active_power)
head(
