png(file="plot3.png")
library(dplyr)
datall<- read.table("household_power_consumption.txt",header=T,sep=";",skip=66636,nrows=2880,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dat1<-mutate(datall,new1=as.Date(Date,"%d/%m/%Y"))
dat2<-mutate(dat1,new2=paste(new1,Time,sep=" "))
dat3<-mutate(dat2,new3=as.POSIXct(strptime(new2,"%Y-%m-%d %H:%M:%S")))
with(dat3,plot(new3,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(dat3,lines(new3,Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",col="red"))
with(dat3,lines(new3,Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",col="blue"))
legend("topright",lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

