

myClasses <- rep("character", times=9)

myFunk <- function(){
        initial <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",
                                               stringsAsFactors = FALSE, nrows = 70000)

        mySubDF <- initial[60000:70000, ]
        myDF <- data.frame( 
                   ObsDate=as.Date(mySubDF$Date, "%d/%m/%Y"),
                   ObsTime=strptime(paste(mySubDF$Date, mySubDF$Time, sep = " "), "%d/%m/%Y %H:%M:%OS"),
                                      ## Date_Time=strptime(paste(initial$Date, initial$Time, sep = " "), "%d/%m/%Y %H:%M:%OS")
                   GlobalActivePower=as.numeric(mySubDF$Global_active_power),
                   GlobalReactivePower= as.numeric(mySubDF$Global_reactive_power),
                   Voltage=as.numeric(mySubDF$Voltage),
                   GlobalIntensity=as.numeric(mySubDF$Global_intensity),
                   SubMeter1=as.integer(mySubDF$Sub_metering_1),
                   SubMeter2=as.integer(mySubDF$Sub_metering_2)
                   )
        startDate <- as.Date("2007-02-01")
        endDate <- as.Date("2007-02-02")

        mySubsetDF <- myDF[myDF$ObsDate <= endDate &  myDF$ObsDate >= startDate, ]

}

## 66638  1/2/2007  Feb 1 2007
## 69518 2/2/2007 Feb 2 2007
  
##colClasses = myClasses,

initial$Date <- as.Date(initial$Date)
initial$Time <- as.POSIXlt.character(initial$Time, tryFormats ="%H:%M:%OS")