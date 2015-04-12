if(!file.exists("data")){dir.create("data")}
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp<-tempfile()
download.file(fileURL, destfile=temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE,  na.strings = "?")
unlink(temp)
dateDownloaded<-date()
dateDownloaded

dataDates<-subset(data, (as.character(data$Date))=="1/2/2007"|as.character(data$Date)=="2/2/2007" )
dataDates$Date<- as.Date(dataDates$Date,"%d/%m/%Y")
dataDates$Time<- strftime(dataDates$Time)


hist(dataDates$Global_active_power, col="red", xlab="Global Active Power ( kilowatts)", ylab="Frequency", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()