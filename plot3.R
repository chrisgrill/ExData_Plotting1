plot3<-function(){
    #Use grep on the command line to pull values for desired dates
    system('grep "^\\(1\\|2\\)\\/2\\/2007" household_power_consumption.txt > feb.txt')
    #Read filtered values into data.frame feb
    feb<-read.table("feb.txt",sep=";",header=TRUE)
    #combine date and time characters
    dtime<-paste(as.character(feb[,1]),as.character(feb[,2]),sep=" ")
    #open png device
    png("plot3.png")
    #plot first series
    plot(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,7],type="l",
         ylab="Energy sub metering",xlab="")
    #plot second series
    lines(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,8],col="red")
    #plot third series
    lines(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,9],col="blue")
    #show legend
    legend (x="topright",legend=c("Sub_metering_1","Sub_metering_2",
                    "Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))
    #close device
    dev.off()
    
    
}