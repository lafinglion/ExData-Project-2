# Read data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract all data records with "coal" in Short.Name variables
v <- grepl("vehicle", SCC$Short.Name, ignore.case = TRUE)
vSCC <- SCC[v,]$SCC
vNEI <- NEI[NEI$SCC %in% vSCC,]

# Sum emissions of Baltimore from extracted subset by year
vBC <- subset(vNEI, vNEI$fips == "24510")

# Add new column for the city name
vBC$city <- "Baltimore City"

# Sum emissions of Los Angeles from extracted subset by year
vLA <- subset(vNEI, vNEI$fips == "06037")

# Add new column for the city name
vLA$city <- "Los Angeles County"

# Aggregate by sum emissions of combined subsets per year
vBCLA <- rbind(vBC, vLA)
vTotal <- aggregate(Emissions ~ year + city, data = vBCLA, sum)

# Make plot and create file
g <- ggplot(data=vTotal, aes(x=year, y=Emissions, color=city))
g <- g + geom_line() + xlab("Year") + ylab("Emissions") + ggtitle("Total Emissions from Vehicle Sources in Baltimore City vs. Los Angeles County")

dev.copy(png, file = "plot6.png", height=480, width=640)
dev.off()
