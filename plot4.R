## This script creates plot 4 for assignment 1

## as there are 4 parts to the assignment and they all use the same date
## I used a little trick so I'd only have to set it up once
if (!exists("datasetup")) {
    ## if the variable datasetup doesn't exist, we've never setup the data
	## this way only the first script executed sets up data for the others
    ## Load the data file
    bd<-read.csv("household_power_consumption.txt",sep=";",colClasses=c(rep("character",9)))
    ## create a proper date/time column from the Data and Time columns
    bd$DT<-strptime(paste(bd$Date,bd$Time),format='%d/%m/%Y %T')
    ## convert the Date column to true date for subsetting below
    bd$Date<-as.Date(bd$Date,format="%d/%m/%Y")
    ## convert the data columns to numeric and let coercion create the NA's
    bd$Global_active_power<-as.numeric(bd$Global_active_power)
    bd$Global_reactive_power<-as.numeric(bd$Global_reactive_power)
    bd$Voltage<-as.numeric(bd$Voltage)
    bd$Global_intensity<-as.numeric(bd$Global_intensity)
    bd$Sub_metering_1<-as.numeric(bd$Sub_metering_1)
    bd$Sub_metering_2<-as.numeric(bd$Sub_metering_2)
    bd$Sub_metering_3<-as.numeric(bd$Sub_metering_3)
    ## select the working subset
    sd<-bd[bd$Date==as.Date('2007-02-01') | bd$Date==as.Date('2007-02-02'),]
	## erase the bigdata data frame as it won't be needed and it's just using up space
	bd<-NULL
	## setup the datasetup variable to signal other scripts they don't have to read the file
    datasetup<-TRUE
}

# Start PNG device driver to save output to the file
png(filename="plot4.png", height=480, width=480,  bg="transparent")
## run the plot

## setup the 2x2 grid
par(mfrow=c(2,2))

##1
hist(sd$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
##2
plot(sd$DT,sd$Voltage,type="l",xlab="datetime",ylab="Voltage")
##3
## run the plot
## determine the mid-point for the X axis
nr<-nrow(sd)
tick<-nr/2
## determine the largest reading from all three columns
gmax<-max(max(sd$Sub_metering_1),max(sd$Sub_metering_2),max(sd$Sub_metering_3))
## determine the number of Y axis ticks by rounding gmax to nearest 10 and cutting it into 4 parts
ytick<-round(gmax,-1)/4
## build the plot lines
plot(sd$Sub_metering_1,type="l",col="black",axes=FALSE,ann=FALSE)
lines(sd$Sub_metering_2,type="l",col="red")
lines(sd$Sub_metering_3,type="l",col="blue")
## add the axes
axis(1,at=c(0,tick,nr),lab=c("Thu","Fri","Sat"))
axis(2,las=1,at=ytick*0:3)
## titles and legends
title(ylab="Energy sub metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, col=c("black","red","blue"), lty=c(1,1,1), lwd=2)
## finally the box around the whole thing
box()
##4
plot(sd$DT,sd$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

## turn off the device to push the graph into the file.
dev.off()
print("plot #4 written to file")