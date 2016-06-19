#load dplyr, data.table, lubridate package
library(dplyr)
library(data.table)
library(lubridate)
library(tidyr)

setwd("/Users/hcam/Desktop/Coursera/Exploratory Data Analysis/HW1")

#read data file
pdata <- tbl_df(fread("household_power_consumption.txt", na.strings = "?",stringsAsFactors = FALSE))

#filtering household power consumption data
pwrdata <- pdata %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    #unite date and time
    unite("Date.Time", c(Date, Time), sep = " " ) %>%
    #change Date.Time format into correct format        
    mutate(Date.Time = dmy_hms(Date.Time))

#start plot3
png(filename = 'plot3.png', width = 480, height = 480, units='px')
plot(pwrdata$Date.Time, as.numeric(pwrdata$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(pwrdata$Date.Time, as.numeric(pwrdata$Sub_metering_2), col ="red")
lines(pwrdata$Date.Time, as.numeric(pwrdata$Sub_metering_3), col ="blue")
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1), lwd= c(1,1))
dev.off()
#plot3 end
