# Read data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract all data records with "coal" in Short.Name variables
v <- grepl("vehicle", SCC$Short.Name, ignore.case = TRUE)
vSCC <- SCC[v,]$SCC
vNEI <- NEI[NEI$SCC %in% vSCC,]

# Sum emissions of Baltimore from extracted subset by year
vBC <- subset(vNEI, vNEI$fips == "24510")
vTotal <- tapply(vBC$Emissions, vBC$year, sum)

# Make plot and create file
barplot(vTotal, xlab = "Year", ylab = "Emissions", main = "Total Emissions from Vehicle Sources from 1999 - 2008")
dev.copy(png, file = "plot5.png", height=480, width=480)
dev.off()
