#load dplyr package
library(dplyr)
library(data.table)
library(lubridate)
library(tidyr)
#plot1 start
setwd("/Users/hcam/Desktop/Coursera/Exploratory Data Analysis/HW1")

#read data file
pdata <- tbl_df(fread("household_power_consumption.txt", na.strings = "?",stringsAsFactors = FALSE))

#filter data into pwrdata
pwrdata <- pdata %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%

#create png file 
png(filename = 'plot1.png', width = 480, height = 480, units='px')
    
#create plot 1
hist(pwrdata$Global_active_power,
       main = "Global Active Power", 
       xlab = "Global Active Power (kilowatt)", col = "red")
#saves plot into plot1.png
dev.off()

#plot1 end
