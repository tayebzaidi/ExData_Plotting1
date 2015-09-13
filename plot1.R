## Code to generate plot1 from scratch
## THis code assumes that the data is contained in a folder in the github
## repository name data/ 

header <- read.table("./data/household_power_consumption.txt", sep = ';', header = FALSE, nrows = 1, stringsAsFactors = FALSE )

pwr <- read.table("./data/household_power_consumption.txt", sep = ';', nrows = (69517 - 66638), skip = 66637, header = FALSE)

colnames(pwr) <- unlist(header)

png(file = "plot1.png")

hist(pwr$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

dev.off()
