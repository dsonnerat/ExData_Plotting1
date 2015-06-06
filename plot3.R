#Coursera - Johns Hopkins - Eploring Data Analysis - Course project 1.
#Plot3

# Loading and preparing data set - same code than the one for plot1

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

# I used max and min function to make sure that the height of the plot is preset properly.
max <- max(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3)
min <- min(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3)
x <- hpc$Time
y <- c(max,rep(min,length(x)-1))

plot(x=x, y=y, col='red', ylab='Energy sub metering', xlab='', type='n')
lines(x=hpc$Time, y=hpc$Sub_metering_1, col='black')
lines(x=hpc$Time, y=hpc$Sub_metering_2, col='red')
lines(x=hpc$Time, y=hpc$Sub_metering_3, col='blue')
legend('topright',lty=1, col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

# Export to npg file
dev.copy(png,file='plot3.png', width=480,height=480)
dev.off()
