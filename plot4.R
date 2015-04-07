# Read entire dataset on txt
powerdata <- read.table("household_power_consumption.txt", comment.char = "", header = T, sep = ";", na.strings = '?')

# Filter dataframe for the dates '1/2/2007' and '2/2/2007'
powerdata.feb <- subset(powerdata, Date %in% c('1/2/2007','2/2/2007'))

# Merge the Date and Time variables in one
powerdata.feb$FullDateTime <- paste(powerdata.feb$Date, powerdata.feb$Time)

# Convert the FullDateTime variable
powerdata.feb$FullDateTime <- strptime(powerdata.feb$FullDateTime, "%d/%m/%Y %H:%M:%S")

# Change the language to English
Sys.setlocale("LC_TIME", "English")

# Launch png device for 480x480 pixels
png("plot4.png", width=480, height=480)

# Divide screen in 2 rows and 2 columns
par(mfrow = c(2, 2))

# Plot graphic for Global_active_power
with(powerdata.feb, plot(FullDateTime, Global_active_power, ylab = "Global Active Power", xlab = "", type='n'))
with(powerdata.feb, lines(FullDateTime, Global_active_power))

# Plot graphic for Voltage
with(powerdata.feb, plot(FullDateTime, Voltage, ylab = "Voltage", xlab = "datetime", type='n'))
with(powerdata.feb, lines(FullDateTime, Voltage))

# Plot graphic for Sub metering
with(powerdata.feb, plot(FullDateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type='n'))
with(powerdata.feb, lines(FullDateTime, Sub_metering_1))
with(powerdata.feb, lines(FullDateTime, Sub_metering_2, col='red'))
with(powerdata.feb, lines(FullDateTime, Sub_metering_3, col='blue'))
# Add legend for sub metering graphic
legend("topright", bty='n', lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot graphic for Global_reactive_power
with(powerdata.feb, plot(FullDateTime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type='n'))
with(powerdata.feb, lines(FullDateTime, Global_reactive_power))


# Close png graphics device
dev.off()
