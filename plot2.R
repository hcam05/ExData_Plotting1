#load dplyr, data.table, lubridate package
library(dplyr)
library(data.table)
library(lubridate)
library(tidyr)

setwd("/Users/hcam/Desktop/Coursera/Exploratory Data Analysis/HW1")

#read data file
pdata <- tbl_df(fread("household_power_consumption.txt", na.strings = "?",stringsAsFactors = FALSE))

#filtering and formatting data frame
pwrdata <- pdata %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
#unite date and time
    unite(pwrdata, "Date.Time", c(Date, Time), sep = " " ) %>%
#change Date.Time format into correct format        
    mutate(Date.Time = dmy_hms(Date.Time))


#plot2 start    
#create png file
png(filename = 'plot2.png', width = 480, height = 480, units='px')
    plot(pwrdata$Date.Time, as.numeric(pwrdata$Global_active_power), 
         type = "l", 
         ylab = "Global Active Power (kilowatts)", 
         xlab = "")
#saves png file
dev.off()
#plot2 end