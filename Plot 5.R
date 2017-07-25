# Load and assign data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Pulls subset of Baltimore and on-road data from full dataset
subset_Baltimore_onroad <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]

# Aggregates data from each year
Yearly_Emissions_Baltimore_onroad <- aggregate(Emissions ~ year, subset_Baltimore_onroad, sum)

# Open device and defines size of image
png("plot5.png", width = 480, height = 480)

# Construct and save barplot
barplot(Yearly_Emissions_Baltimore_onroad$Emissions, names.arg = Yearly_Emissions_Baltimore_onroad$year,
	main = "On-Road Emissions by Year for Baltimore City, MD", xlab = "Year", ylab = "Sum of on-road PM2.5 emissions (tons)")
dev.off()
