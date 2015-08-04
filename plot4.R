
# plot4. R

## load data ##
dataset <- read.table("C:/Users/Deng/Documents/household_power_consumption.txt",
          header = TRUE, sep = ";", na = "?",
          colClasses = c("character", "character", rep("numeric",7)) )
attach(dataset)

## subset the data ##
newdat <- dataset[Date == "1/2/2007" | Date == "2/2/2007", ]
attach(newdat)
DT <- paste(Date, Time)
newdat$DateTime <- strptime(DT, "%d/%m/%Y %H:%M:%S")
rownames(newdat) <- 1:nrow(newdat)
attach(newdat)

## plot figure 4 ##
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
## 1. Top-left
plot(newdat$DateTime, newdat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
## 2.Top-right
plot(newdat$DateTime, newdat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
## 3. Bottom-left
plot(newdat$DateTime, newdat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(newdat$DateTime, newdat$Sub_metering_2, col = "red")
lines(newdat$DateTime, newdat$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lwd = 1, bty = "n")
## 4.Bottom-right
plot(newdat$DateTime, newdat$Global_reactive_power, type = "l",xlab = "datetime", ylab = "Global Active Power",col = "black")
dev.off()
