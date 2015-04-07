# Read entire dataset on txt
powerdata <- read.table("household_power_consumption.txt", comment.char = "", header = T, sep = ";", na.strings = '?')

# Filter dataframe for the dates '1/2/2007' and '2/2/2007'
powerdata.feb <- subset(powerdata, Date %in% c('1/2/2007','2/2/2007'))

# Launch png device for 480x480 pixels
png("plot1.png", width=480, height=480)

# Plot histogram for Global_active_power
with(powerdata.feb, hist(Global_active_power, main = "Global Active Power", col='red', xlab = "Global Active Power (kilowatts)"))

# Close png graphics device
dev.off()
