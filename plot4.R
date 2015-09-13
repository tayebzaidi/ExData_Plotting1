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

png(file = "plot4.png")

par("mfrow" = c(2,2))

plot(pwr$DateTime, pwr$Global_active_power, xlab = "", ylab = "Global Active Power", type = 'l')

plot(pwr$DateTime, pwr$Voltage, ylab = "Voltage", type = 'l', xlab = "datetime")

plot(pwr$DateTime, pwr$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = 'l', col = "black")

points(pwr$DateTime, pwr$Sub_metering_2, type = 'l', col = "red")

points(pwr$DateTime, pwr$Sub_metering_3, type = 'l', col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))

plot(pwr$DateTime, pwr$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = 'l')

dev.off()
