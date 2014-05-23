#Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# 1. load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


scc_index <- SCC$SCC[grep("Vehicles", SCC$EI.Sector)]
sub_NEI <- NEI[NEI$SCC %in% scc_index & NEI$fips == "24510",]

x<-split(sub_NEI$Emissions, sub_NEI$year)


pollute <-sapply(x, sum, na.rm = T)


scc_index <- SCC$SCC[grep("Vehicles", SCC$EI.Sector)]
sub_NEI <- NEI[NEI$SCC %in% scc_index & NEI$fips == "06037",]

y<-split(sub_NEI$Emissions, sub_NEI$year)

pollute1 <-sapply(y, sum, na.rm = T)



year <- c(1999, 2002, 2005, 2008)
#p_inc <- c(pollute[2]/pollute[1]-1,pollute[3]/pollute[2]-1,pollute[4]/pollute[3]-1)
#p1_inc<- c(pollute1[2]/pollute1[1]-1,pollute1[3]/pollute1[2]-1,pollute1[4]/pollute1[3]-1)
data<-data.frame(year=c(year,year), emission=c(pollute, pollute1), 
                 city=c(rep("Baltimore",4),rep("Los Angeles",4)))


library(ggplot2)
png("hw2_plot6.png")
qplot(year, emission, data=data, color = factor(city), geom = c("point", "line"),main = 'Emission from Motor vehicle sources', ylab = 'PM25 emission')
dev.off()