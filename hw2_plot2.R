# This is home work 2 for explore data

# 1. load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

x<-split(NEI$Emissions, NEI$year)

year <- c(1999, 2002, 2005, 2008)
pollute <-sapply(x, sum, na.rm = T)


# 2. plot
png("hw2_plot2.png")
plot(year, pollute, main = 'Total emissions from PM25 in Baltimore City', ylab = 'PM25')
lines(year, pollute)
dev.off()