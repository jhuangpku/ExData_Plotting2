# This is home work 2 for explore data

# 1. load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
data <- transform(subset(NEI, NEI$fips == "24510"), type = factor(type))
#qplot(year, Emissions, data = data, facet = .~type, stat = "summary", fun.y = "sum")
png("hw2_plot3.png")
qplot(year, Emissions, data = data, 
      stat = "summary", fun.y = "sum", 
      geom = c("point", "line"), 
      facets = .~type,
      main = "Total emissions from PM25 in Baltimore City")
dev.off()
