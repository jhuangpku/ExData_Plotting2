# This is home work 2 for explore data
# Across the United States, how have emissions from coal combustion-related sources changed from 1999¨C2008?
# 1. load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


scc_index <- SCC$SCC[grep("Coal", SCC$EI.Sector)]
sub_NEI <- NEI[NEI$SCC %in% scc_index,]

x<-split(sub_NEI$Emissions, sub_NEI$year)

year <- c(1999, 2002, 2005, 2008)
pollute <-sapply(x, sum, na.rm = T)

png("hw2_plot4.png")
plot(year, pollute, main = 'Total emissions from PM25 in coal combustion-related sources', ylab = 'PM25')
lines(year, pollute)
dev.off()
