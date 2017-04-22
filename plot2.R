# Read data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum emissions of Baltimore subset by year
BC <- subset(NEI, NEI$fips == "24510")
bcTotal <- tapply(BC$Emissions, BC$year, sum)

# Make plot and create file
barplot(bcTotal, xlab = "Year", ylab="Emissions", main = "Total Emissions in Baltimore City")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()