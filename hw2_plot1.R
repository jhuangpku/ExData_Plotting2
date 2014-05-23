# This is home work 2 for explore data

# 1. load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

year <- c(1999, 2002, 2005, 2008)
pollute <- c(
              sum(NEI$Emissions[NEI$year == 1999]),
              sum(NEI$Emissions[NEI$year == 2002]),
              sum(NEI$Emissions[NEI$year == 2005]),
              sum(NEI$Emissions[NEI$year == 2008])
              )
# 2. plot
png("hw2_plot1.png")
plot(year, pollute, main = 'Total emissions from PM25 in USA', ylab = 'PM25')
lines(year, pollute)
dev.off()