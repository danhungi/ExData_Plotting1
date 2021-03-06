#############################  Coursera Expl Data Analysis ################################

#################################### 6/05/2014 Dan Hungerford #########################################

#################################### Last updated 6/05/2014   #########################################



############## read data#####################
a<- file.choose()
setwd(dirname(a))
dat<- read.table("household_power_consumption.txt",dec=".",header=T,strip.white=TRUE, sep=";",as.is=T, na.strings = "?")

############## Subset based on 1-2 of feb 2007 #########################
dat<- subset(dat,Date=="1/2/2007" | Date=="2/2/2007")

############## Change date to date field ##############################
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat$DateTime<-strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")

############# Figure 4 ########################
par(mfrow=c(2,2))
plot(dat$DateTime,dat$Global_active_power, type="l", xlab="", ylab="Global acitve power")
plot(dat$DateTime,dat$Voltage, type="l", xlab="datetime", ylab="Voltage")
yrange<-range(c(dat$Sub_metering_1,dat$Sub_metering_2,dat$Sub_metering_3))
plot(dat$DateTime,dat$Sub_metering_1,type="l",ylim=yrange,col=2, ylab="Energy sub metering", xlab="")
lines(dat$DateTime,dat$Sub_metering_2,type="l",col=3)
lines(dat$DateTime,dat$Sub_metering_3,type="l",col=4)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.6, col=c(2,3,4), lwd=2, bty="n")
with(dat,plot(dat$DateTime,Global_reactive_power, type="l", xlab="datetime"))
dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()