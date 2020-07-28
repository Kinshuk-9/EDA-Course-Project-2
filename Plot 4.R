
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- grep('Coal',SCC$EI.Sector)
a4 <- SCC[coal,]
q4 <- merge(NEI,a4,by = 'SCC')
t4 <- with(q4, tapply(Emissions, year, sum))
d4 <- data.frame(Year= names(t4), Emissions = t4)

png("plot4.png", width=480, height=480)
barplot(height = d4$Emissions/1000, names.arg = d4$Year, ylim = c(0,750),
        col = c('chartreuse','blue4', 'orchid', 'bisque'),
        xlab="Years", ylab='Total PM Emissions in kilotons',
        main='Total PM emissions from Coal Sources for various years')
dev.off()
