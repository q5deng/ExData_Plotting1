
# plot2. R

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

## plot figure 2 ##
dev.new()
png(filename = "plot2.png", 
     width = 480, height = 480)
plot(newdat$DateTime, newdat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

dev.off()