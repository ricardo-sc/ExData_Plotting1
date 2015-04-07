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
png("plot2.png", width=480, height=480)

# Plot graphic for Global_active_power
with(powerdata.feb, plot(FullDateTime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type='n'))
with(powerdata.feb, lines(FullDateTime, Global_active_power))

# Close png graphics device
dev.off()
