# Load and assign data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregates data from each year
Yearly_Emissions <- aggregate(Emissions ~ year, NEI, sum)

# Open device and defines size of image
png("plot1.png", width = 480, height = 480)

# Construct and save barplot
barplot(Yearly_Emissions$Emissions, names.arg = Yearly_Emissions$year,
	main = "Emissions by Year", xlab = "Year", ylab = "Sum of all PM2.5 emissions (tons)")
dev.off()
