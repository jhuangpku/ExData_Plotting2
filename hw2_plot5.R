#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 

# This is home work 2 for explore data
# 1. load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


scc_index <- SCC$SCC[grep("Vehicles", SCC$EI.Sector)]
sub_NEI <- NEI[NEI$SCC %in% scc_index & NEI$fips == "24510",]

x<-split(sub_NEI$Emissions, sub_NEI$year)

year <- c(1999, 2002, 2005, 2008)
pollute <-sapply(x, sum, na.rm = T)

png("hw2_plot5.png")
plot(year, pollute, main = 'Total emissions from PM25 in motor vehicle sources in Baltimore', ylab = 'PM25')
lines(year, pollute)
dev.off()
