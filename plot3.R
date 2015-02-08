# plot3.R: Exploratory Data Analysis Assignment1, Plot 3

# Read household power consumption data
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings= "?", 
      colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                "numeric","numeric", "numeric", "numeric" ) )
     
#convert date text into date field
hpc$hpc_date <- as.Date(hpc$Date, format="%d/%m/%Y")

# Select dates needed forthis purpose
hpc_project1 <- subset(hpc, subset= hpc_date== '2007-02-01' | hpc_date== '2007-02-02')

# Create datetime field for plotting
hpc_project1$dt <- as.POSIXlt(paste(hpc_project1$hpc_date, hpc_project1$Time, sep = ""))

tail(hpc_project1)

#Direct output to png file
png(file= "plot3.png", width=480, height=480, units="px")


# Plot 3 for the assignment
attach(hpc_project1)

plot(dt, Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "l" )
lines(dt, Sub_metering_2, col="red")
lines(dt, Sub_metering_3, col="blue")
legend(
  "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lwd = .95, cex = .95
  )

detach(hpc_project1)

dev.off()
