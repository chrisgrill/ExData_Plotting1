plot1<-function(){
    #Use grep on the command line to pull values for desired dates
    system('grep "^\\(1\\|2\\)\\/2\\/2007" household_power_consumption.txt > feb.txt')
    #Read filtered values into data.frame feb
    feb<-read.table("feb.txt",sep=";",header=TRUE)
    #display the plot
    hist(feb[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
    #copy displayed plot to png device driver
    dev.copy(png,"plot1.png")
    dev.off()
    
    
}