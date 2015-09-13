##R file to create the Plot 1 in Exploratory Data Analysis - Assignment 1

#read the data. Please change the path of the csv folder as per your system
#variables are separated by ; in the csv file.
#read all variable values as string first. ? character in the data file will give the problem if we 
#read it as numeric
hpc<-read.csv("../data/household_power_consumption.txt",sep=";",colClasses=c(rep("character",9)))


#Filter the data based on date as soon as possible in your process
#remember the variable value is still in string and not in the date data type yet
fpc<-hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

#merge date and time variable together to come up with the new derived variable 
fpc<-cbind(dttm = strptime(paste(fpc$Date, fpc$Time , sep =" ") , "%d/%m/%Y %T"), fpc)

#change the data type to numeric wherever applicable
fpc<-transform(fpc, Global_active_power = as.numeric(Global_active_power) , Global_reactive_power = as.numeric(Global_reactive_power), Voltage = as.numeric(Voltage) , Global_intensity = as.numeric(Global_intensity),  Sub_metering_1 = as.numeric(Sub_metering_1) , Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3))


#open the png graphic device; specify the width and height as per the assignment instruction
png(file = "plot1.png", bg = "transparent",width = 480, height = 480)

#create the actual plot
hist(fpc$Global_active_power,col = "red",xlab = "Golbal Active Power(kilowatts)",main = "Global Active Power")

#close the graphic device. Important if we dont do that plot file will not be created correctly
dev.off()
