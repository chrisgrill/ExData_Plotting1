plot4<-function(){
    #Use grep on the command line to pull values for desired dates
    system('grep "^\\(1\\|2\\)\\/2\\/2007" household_power_consumption.txt > feb.txt')
    #Read filtered values into data.frame feb
    feb<-read.table("feb.txt",sep=";",header=TRUE)
    #combine date and time characters
    dtime<-paste(as.character(feb[,1]),as.character(feb[,2]),sep=" ")
    #open png device
    png("plot4.png")
    par(mfrow=c(2,2))
    #first plot Global active power
    plot(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,3],type="l",
         ylab="Global Active Power (kilowatts)",xlab="")
    #second plot Voltage
    plot(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,5],type="l",
         ylab="Voltage",xlab="datetime")
    #third plot Sub metering
    #plot first series
    plot(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,7],type="l",
         ylab="Energy sub metering",xlab="")
    #plot second series
    lines(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,8],col="red")
    #plot third series
    lines(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,9],col="blue")
    #show legend
    legend (x="topright",legend=c("Sub_metering_1","Sub_metering_2",
                                  "Sub_metering_3"),col=c("black","red","blue"),
            lty=c(1,1),bty="n")
    #plot four Global reactive power
    plot(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,4],type="l",
         ylab="Global_reactive_power",xlab="datetime")
    #close device
    dev.off()
    
    
}