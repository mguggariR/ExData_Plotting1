## It is assumed that the given dataset is located in the working directory
## from evluating the txt file it can be observed that required time frame falls within row numbers 60000 to 70000
## This information was used to Subsetting the data set 

GenerateSecondPlot <- function(){
        initial <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",
                                               stringsAsFactors = FALSE, nrows = 70000)

        mySubDF <- initial[60000:70000, ]
        myDF <- data.frame( 
                   ObsDate=as.Date(mySubDF$Date, "%d/%m/%Y"),
                   ObsTime=strptime(paste(mySubDF$Date, mySubDF$Time, sep = " "), "%d/%m/%Y %H:%M:%OS"),
                                      
                   ## GlobalActivePower=as.numeric(mySubDF$Global_active_power),
                   ## GlobalReactivePower= as.numeric(mySubDF$Global_reactive_power),
                   ## Voltage=as.numeric(mySubDF$Voltage),
                   ## GlobalIntensity=as.numeric(mySubDF$Global_intensity),
                   SubMeter1=as.integer(mySubDF$Sub_metering_1),
                   SubMeter2=as.integer(mySubDF$Sub_metering_2),
                   SubMeter3=as.integer(mySubDF$Sub_metering_3)
                   )
        startDate <- as.Date("2007-02-01")
        endDate <- as.Date("2007-02-02")

        mySubsetDF <- myDF[myDF$ObsDate <= endDate &  myDF$ObsDate >= startDate, ]
        
        ## png(filename="plot2.png")
        
        plot(mySubsetDF$ObsTime, mySubsetDF$SubMeter1, type = "l", col="black", ylab = "Energy sub metering", xlab = "")
        lines(mySubsetDF$ObsTime, mySubsetDF$SubMeter2, col="red")
        lines(mySubsetDF$ObsTime, mySubsetDF$SubMeter3, col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2,2,2), col=c("black","red", "Blue"))

        ## dev.off()
   
        }




  
