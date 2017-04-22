# Read data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum emissions by year
xTotal <- tapply(NEI$Emissions, NEI$year, sum)

# Make plot and create file
barplot(xTotal, xlab = "Year", ylab = "Emissions", main = "Total Anuual Emissions")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()