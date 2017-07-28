# Load and assign data - assumes files are present in working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge datasets
labeled_data <- merge(NEI, SCC, by = "SCC")

# Creates subset of data including coal in the description
coal <- grepl("coal", labeled_data$Short.Name, ignore.case = TRUE)
subset_coal <- labeled_data[coal, ]

# Aggregates sums of coal data by year
aggregated_coal <- aggregate(Emissions ~ year, subset_coal, sum)

# Open device and defines size of image
png("plot4.png", width = 480, height = 480)

# Construct and save bar plot
barplot(aggregated_coal$Emissions, names.arg = aggregated_coal$year,
	main = "National Coal-Related Emissions by Year", xlab = "Year", ylab = "Sum of all PM2.5 emissions from coal-related sources (tons)")
dev.off()
