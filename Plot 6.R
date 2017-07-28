# Load and assign data - assumes files are present in working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Pulls subset of Baltimore and on-road data from full dataset
subset_Baltimore_onroad <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]

# Pulls subset of Los Angeles for on-road data from full dataset
subset_LA_onroad <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD", ]

# Aggregates data from each year for each city
Yearly_Emissions_Baltimore_onroad <- aggregate(Emissions ~ year, subset_Baltimore_onroad, sum)
Yearly_Emissions_LA_onroad <- aggregate(Emissions ~ year, subset_LA_onroad, sum)


# Open device and defines size of image
png("plot6.png", width = 1000, height = 600)

# Construct and save line plot
plot(Yearly_Emissions_LA_onroad$year, Yearly_Emissions_LA_onroad$Emissions, 
	type = "l", col = "black", xlim = c(1999, 2008), ylim = c(0,5000),
	ylab = "Sum of on-road PM2.5 emissions (tons)", xlab = "Year", main = "On-Road Emissions by Year for Baltimore City, MD and Los Angeles County, CA")
# Add data for LA
lines(Yearly_Emissions_Baltimore_onroad$year, Yearly_Emissions_Baltimore_onroad$Emissions, 
	type = "l", col = "red")
legend(border = "black", "right", c("LA", "Baltimore"), lty = 1, lwd = 2.5, col = c("black", "red"))
dev.off()
