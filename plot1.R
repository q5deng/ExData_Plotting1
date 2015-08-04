

# plot1. R

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

## plot figure 1 ##
dev.new()
png(filename = "plot1.png", 
    width = 480, height = 480)
hist(newdat$Global_active_power,   main = "Global Active Power", xlab = "Global Active Power", ylab = "Frequency", col = "red",
     breaks = 12, ylim = c(0, 1200))
dev.off()
