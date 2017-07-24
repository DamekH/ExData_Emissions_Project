# Load and assign data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Pulls subset of Baltimore data from full dataset
subset_Baltimore <- NEI[NEI$fips == "24510", ]

# Aggregates data from each year
Yearly_Emissions_Baltimore <- aggregate(Emissions ~ year, subset_Baltimore, sum)

# Open device and defines size of image
png("plot2.png", width = 480, height = 480)

# Construct and save barplot
barplot(Yearly_Emissions_Baltimore$Emissions, names.arg = Yearly_Emissions_Baltimore$year,
	main = "Emissions by Year for Baltimore City, MD", xlab = "Year", ylab = "Sum of all PM2.5 emissions (tons)")
dev.off()
