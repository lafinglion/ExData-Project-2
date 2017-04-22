# Read data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge two data sets
NEISCC <- merge(NEI, SCC, by="SCC")

# Extract all data records with "coal" in Short.Name variables
coal <- grep("coal", NEISCC$Short.Name, ignore.case = TRUE)
NEISCCsub <- NEISCC[coal,]

# Sum emissions of extracted subset by year
subTotal <- tapply(NEISCCsub$Emissions, NEISCCsub$year, sum)

# Make plot and create file
barplot(subTotal, xlab="Year", ylab="Emissions", main = "Total Emissions from Coal Sources from 1999 - 2008")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()