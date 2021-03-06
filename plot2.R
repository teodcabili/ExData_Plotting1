##0. Install required packages and loading these packages:----
#install.packages("data.table")
#install.packages("dplyr")
library(data.table)
library(dplyr)
wd <- getwd()

##1. Reading the Data (make sure that the text file is in the current working directory):----
p_cons <- data.table::fread(input = paste0(wd,"/household_power_consumption.txt"), na.strings="?")

##2. Filter out observations with Dates 2007-02-01 and 2007-02-02:----
p_cons <- p_cons %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

##3. Changing the class of the variable "Date" from character to Date:----
p_cons$Date <- as.Date(p_cons$Date, format = "%d/%m/%Y")

##4. Combining the Date and Time variable and creating a new column in dataset named "Date_Time":----
p_cons$Date_Time <- as.POSIXct(paste(p_cons$Date, p_cons$Time))

##5. Generating plot2.png:----
png("plot2.png", width = 480, height = 480)

  plot(p_cons$Date_Time, p_cons$Global_active_power, type="l", xlab="", ylab= "Global Active Power (kilowatts)")

dev.off()

