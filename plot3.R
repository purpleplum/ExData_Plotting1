plot3 <- function() {
## Read power usage data
power <- read.table("household_power_consumption.txt",sep=";", header=TRUE,colClasses = c( "character", "character","numeric", "numeric",
    "numeric","numeric","numeric", "numeric", "numeric"),fill=TRUE,na.strings=c('?','NA','-'),stringsAsFactors=F)

## Create a field of time data type
power$Date_Time<-paste(power$Date,power$Time)
power$Date_Time<-strptime(power$Date_Time, "%d/%m/%Y %H:%M:%S",tz="US/Pacific")

##select records by date
sel_power<-subset(power,as.Date(power$Date,"%d/%m/%Y")>=as.Date("1/2/2007","%d/%m/%Y") & as.Date(power$Date,"%d/%m/%Y")<=as.Date("2/2/2007","%d/%m/%Y"))


##plot global_active_power vs time
with(sel_power,plot(Date_Time,Sub_metering_1 ,main = "",type="n",ylab = "Energy sub metering", xlab = ""))
with(sel_power,lines(Date_Time,Sub_metering_1,col="black"))
with(sel_power,lines(Date_Time,Sub_metering_2,col="red"))
with(sel_power,lines(Date_Time,Sub_metering_3,col="blueviolet"))
legend("topright", lwd=1,col = c("black", "red","blueviolet"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


##output plot to a png of 480 by 480 pixels
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

}