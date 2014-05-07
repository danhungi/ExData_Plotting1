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


############# Figure 1 ########################
par(mfrow=c(1,1))
hist(dat$Global_active_power,main="Global active power", ylab="Frequency", xlab="Global acitve power",col="red")
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()