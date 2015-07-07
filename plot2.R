library(data.table)
library(datasets)

hhpower<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, dec=".",header=TRUE,na.strings="?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
hhpower2 <- hhpower[which(hhpower$Date=="1/2/2007" | hhpower$Date=="2/2/2007"), ]

# You may find it useful to convert the Date and Time variables to Date/Time classes 
# in R using the strptime() and as.Date() functions.

hhpower2$datetime<-strptime(paste(hhpower2$Date,hhpower2$Time,sep=" "),"%d/%m/%Y %H:%M:%S") 

#START PLOTTING HERE!

plot(hhpower2$datetime
     ,hhpower2$Global_active_power
     ,xlab=""
     ,ylab="Global Active Power (kilowatts)"
     ,type="l"
)
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()

