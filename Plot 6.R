
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motor <- grep('Vehicle',SCC$EI.Sector)
a5 <- SCC[motor,]
b5 <- NEI[NEI$fips == '24510',]
q5 <- merge(b5,a5, by = 'SCC')
t5 <- with(q5, tapply(Emissions, year, sum))
d5 <- data.frame(Year= names(t5), Emissions = t5)

b6 <- NEI[NEI$fips == '06037',]
q6 <- merge(b6,a5, by = 'SCC')
t6 <- with(q6, tapply(Emissions, year, sum))
d6 <- data.frame(Year= names(t6), Emissions = t6)




png("plot6.png", width=960, height=480)
par(mfrow = c(1,2))
barplot(height = d5$Emissions/1000, names.arg = d5$Year, ylim = c(0,10),
        col = c('chartreuse','blue4', 'orchid', 'bisque'),
        xlab="Years", ylab='Total PM Emissions in kilotons',
        main='Vehicle Emissions in Baltimore')
barplot(height = d6$Emissions/1000, names.arg = d6$Year, ylim = c(0,10),
        col = c('chartreuse','blue4', 'orchid', 'bisque'),
        xlab="Years", ylab='Total PM Emissions in kilotons',
        main='Vehicle Emissions in Los Angeles')
dev.off()