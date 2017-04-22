# Read data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Aggregate by sum emissions of Baltimore subset per year
BC <- subset(NEI, NEI$fips=="24510")
bcTotal <- aggregate(Emissions ~ year + type, data = BC, sum)

# Make plot and create file
g <- ggplot(data = bcTotal, aes(x = year, y = Emissions, color = type))
g <- g + geom_line() + xlab("Year") + ylab("Emissions") + ggtitle("Total Emissions in Baltimore City by Type")
dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off()
