# plot2.R: Exploratory Data Analysis Assignment1, Plot 2

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

# tail(hpc_project1) # just checking

# Open png device
png(file= "plot2.png", width=480, height=480, units="px")

# Plot 2 for the assignment
plot(hpc_project1$dt, hpc_project1$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l"
      )
#Close png device
dev.off()