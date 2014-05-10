plot2<-function(){
    #Use grep on the command line to pull values for desired dates
    system('grep "^\\(1\\|2\\)\\/2\\/2007" household_power_consumption.txt > feb.txt')
    #Read filtered values into data.frame feb
    feb<-read.table("feb.txt",sep=";",header=TRUE)
    #combine date and time characters
    dtime<-paste(as.character(feb[,1]),as.character(feb[,2]),sep=" ")
    #display the plot
    plot(strptime(dtime,format="%d/%m/%Y %H:%M:%S"),feb[,3],type="l",ylab="Global Active Power (kilowatts)",xlab="")
    #copy displayed plot to png device driver
    dev.copy(png,"plot2.png")
    dev.off()
    
    
}