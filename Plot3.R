# Load and assign data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load ggplot2
library(ggplot2)

# Pulls subset of Baltimore data from full dataset
subset_Baltimore <- NEI[NEI$fips == "24510", ]

# Aggregates data from each year
Yearly_Emissions_by_type_Baltimore <- aggregate(Emissions ~ year + type, subset_Baltimore, sum)

# Open device and define size of image
png("plot3.png", width = 480, height = 480)

# Construct and save barplot
graph <- ggplot(Yearly_Emissions_by_type_Baltimore, aes(year, Emissions, color = type))
graph <- graph + geom_line() +
  xlab("year")+
  ylab("Total PM2.5 Emissions") +
  ggtitle("Total Emissions in Baltimore City, MD")
print(graph)
dev.off()
