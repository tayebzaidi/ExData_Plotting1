## Code to generate plot1 from scratch
## THis code assumes that the data is contained in a folder in the github
## repository name data/ 

header <- read.table("./data/household_power_consumption.txt", sep = ';', header = FALSE, nrows = 1, stringsAsFactors = FALSE )

pwr <- read.table("./data/household_power_consumption.txt", sep = ';', nrows = (69517 - 66638), skip = 66637, header = FALSE)

colnames(pwr) <- unlist(header)

times <- pwr$Time
dates <- pwr$Date

DateTime <- paste(dates, time)

DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")

pwr$DateTime <- DateTime

png(file = "plot2.png")

plot(pwr$DateTime, pwr$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = 'l')

dev.off()
