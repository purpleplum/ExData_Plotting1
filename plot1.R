plot1 <- function() {
## Read power usage data
power <- read.table("household_power_consumption.txt",sep=";", header=TRUE,colClasses = c( "character", "character","numeric", "numeric",
    "numeric","numeric","numeric", "numeric", "numeric"),fill=TRUE,na.strings=c('?','NA','-'),stringsAsFactors=F)

## Create a field of time data type
power$Date_Time<-paste(power$Date,power$Time)
power$Date_Time<-strptime(power$Date_Time, "%d/%m/%Y %H:%M:%S",tz="US/Pacific")

##select records by date
sel_power<-subset(power,as.Date(power$Date,"%d/%m/%Y")>=as.Date("1/2/2007","%d/%m/%Y") & as.Date(power$Date,"%d/%m/%Y")<=as.Date("2/2/2007","%d/%m/%Y"))

##plot global_active_power histogram
with(sel_power,hist(Global_active_power,col = "red",main = "Global Active Power",
xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))

##output plot to a png of 480 by 480 pixels
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

}
