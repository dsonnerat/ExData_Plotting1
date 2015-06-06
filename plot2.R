#Coursera - Johns Hopkins - Eploring Data Analysis - Course project 1.
#Plot2

# Loading and preparing data set

zipname <- 'data.zip'
datafilename <- 'household_power_consumption.txt'

if(!exists('hpc')){
        if(!file.exists(datafilename)){
                if(!file.exists(zipname)){
                        download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', zipname)
                }
                unzip(zipname)
        }
        
        hpc <- read.table(datafilename, na.strings = '?', header=T, sep=';', stringsAsFactors=F)
        hpc <- subset(hpc,hpc$Date %in% c('1/2/2007','2/2/2007'))
        hpc$Time <- strptime(paste(hpc$Date,hpc$Time),'%d/%m/%Y %H:%M:%S')
        hpc$Date <- as.Date(hpc$Date,'%d/%m/%Y')
}

# plot 
Sys.setlocale("LC_TIME", "English_United States.1252") 
plot(x=hpc$Time, y=hpc$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='n')
lines(x=hpc$Time, y=hpc$Global_active_power)

# Export to npg file
dev.copy(png,file='plot2.png', width=480,height=480)
dev.off()
