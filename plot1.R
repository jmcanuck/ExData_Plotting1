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

# Start PNG device driver to save output to figure.png
png(filename="plot1.png", height=540, width=540,  bg="white")
hist(sd$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
## turn off the device to push the graph into the file.
dev.off()