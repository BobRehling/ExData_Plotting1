# plot1.R: Exploratory Data Analysis Assignment1, Plot 1

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

tail(hpc_project1)  # just checking

#Direct output to png file
png(file= "plot1.png", width=480, height=480, units="px")

# Plot 1 for the assignment
hist(hpc_project1$Global_active_power, 
     col="red",
     main='Global Active Power',
     xlab='Global Active Power (kilowats)')

# Close png device
dev.off()