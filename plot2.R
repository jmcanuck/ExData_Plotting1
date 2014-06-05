## This script creates plot 2 for assignment 1

## as there are 4 parts to the assignment and they all use the same date
## I used a little trick so I'd only have to set it up once
if (!exists("datasetup")) {
    ## if the variable datasetup doesn't exist, we've never setup the data
	## this way only the first script sets up data for the others
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
png(filename="plot2.png", height=540, width=540,  bg="transparent")
## run the hist function to make the graphic
plot(sd$DT,sd$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
## turn off the device to push the graph into the file.
dev.off()
print("plot 2 written to file")