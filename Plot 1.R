#importing the data set into r environment
setwd("C:\\Users\\pswar\\Desktop")
my_data <-
  data.table::fread(input = "household_power_consumption.txt", na.strings = "?")


#converting the date and time variables into desired format
##changing the time zone to the local time zone
my_data$Date <- as.POSIXct(my_data$Date, format = "%d/%m/%Y", tz = "")
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
my_data$Time <- as.POSIXct(my_data$Time, format = "%H:%M:%OS", tz = "")
my_data$Time <- strftime(my_data$Time, format = "%H:%M:%OS")
my_data$DateTime <- as.POSIXct(paste(my_data$Date,my_data$Time),format = "%Y-%m-%d %H:%M:%OS")
#converting the variables into factor class to numeric class
my_data[, c(3:8)] <- lapply(my_data[, c(3:8)], as.numeric)
#subseting the required data
final_data <-
  subset(my_data, Date >= "2007-02-01" & Date <= "2007-02-02")
#initilizating the desired graphic device and setting the specified dimentions
png("plot1.png", width = 480, height = 480)
#plotting the histogram
hist(
  final_data$Global_active_power,
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency",
  col = "Red"
)
#turning off the active graphic device
dev.off()