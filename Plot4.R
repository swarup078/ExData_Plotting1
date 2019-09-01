#importing the data set into r environment
setwd("C:\\Users\\pswar\\Desktop\\Exploratory Data analysis W1")
my_data <-
  data.table::fread(input = "household_power_consumption.txt", na.strings = "?")


#converting the date and time variables into desired format
##changing the time zone to the local time zone
my_data$Date <- as.POSIXct(my_data$Date, format = "%d/%m/%Y", tz = "")
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
my_data$Time <- as.POSIXct(my_data$Time, format = "%H:%M:%OS", tz = "")
my_data$Time <- strftime(my_data$Time, format = "%H:%M:%OS")
my_data$DateTime <- as.POSIXct(paste(my_data$Date,my_data$Time),format = "%Y-%m-%d %H:%M:%OS")
#changing the data type from factor to numeric
my_data[, c(3:8)] <- lapply(my_data[, c(3:8)], as.numeric)
#initilizating the desired graphic device and setting the specified dimentions
png("plot4.png", width = 480, height = 480)
#settig the graphic device for the specific rows and cols
par(mfrow = c(2,2))
#plotting
#plot 1
plot(
  x = final_data$DateTime,
  y = final_data$Global_active_power,
  ,
  type = "l",
  xlab = "",
  ylab = ""
)
#plot 2
plot(
  x = final_data$DateTime,
  y = final_data$Voltage,
  ,
  type = "l",
  xlab = "DateTime",
  ylab = "Voltage"
)
#plot 3
plot(
  x = final_data$DateTime,
  y = final_data$Sub_metering_1,
  ,
  type = "l",
  xlab = "",
  ylab = "Energy sub Metering"
)
lines(final_data$DateTime,
      final_data$Sub_metering_2,
      col = "red")
lines(final_data$DateTime,
      final_data$Sub_metering_3,
      col = "blue")
legend(
  "topright"
  , col=c("black","red","blue")
  , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
  ,lty=c(1,1), lwd=c(1,1))
#plot 4
plot(
  x = final_data$DateTime,
  y = final_data$Global_reactive_power,
  ,
  type = "l",
  xlab = "DateTime",
  ylab = "Gobal Reactive Power"
)
#turning off the active graphic device
dev.off()


