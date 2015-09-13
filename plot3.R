## Code to generate plot1 from scratch
## THis code assumes that the data is contained in a folder in the github
## repository name data/ 

header <- read.table("./data/household_power_consumption.txt", sep = ';', header = FALSE, nrows = 1, stringsAsFactors = FALSE )

pwr <- read.table("./data/household_power_consumption.txt", sep = ';', nrows = (69517 - 66638), skip = 66637, header = FALSE)

colnames(pwr) <- unlist(header)

times <- pwr$Time
dates <- pwr$Date

DateTime <- paste(dates, times)

DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")

pwr$DateTime <- DateTime

png(file = "plot3.png")

plot(pwr$DateTime, pwr$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = 'l', col = "black")

points(pwr$DateTime, pwr$Sub_metering_2, type = 'l', col = "red")

points(pwr$DateTime, pwr$Sub_metering_3, type = 'l', col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))

dev.off()

