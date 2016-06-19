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

#set up plot 4 
png(filename = 'plot4.png', width = 480, height = 480, units='px')
par(mfrow = c(2,2))
#1st plot date.time and global active power
plot(pwrdata$Date.Time, as.numeric(pwrdata$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")
#2nd plot 
plot(pwrdata$Date.Time, as.numeric(pwrdata$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
#3rd plot
plot(pwrdata$Date.Time, as.numeric(pwrdata$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
    lines(pwrdata$Date.Time, as.numeric(pwrdata$Sub_metering_2), col ="red")
    lines(pwrdata$Date.Time, as.numeric(pwrdata$Sub_metering_3), col ="blue")
    legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1), lwd= c(1,1))
#4th plot
plot(pwrdata$Date.Time, as.numeric(pwrdata$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
#save plot
dev.off()
#plot4 end
