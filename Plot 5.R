NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motor <- grep('Vehicle',SCC$EI.Sector)
a5 <- SCC[motor,]
b5 <- NEI[NEI$fips == '24510',]
q5 <- merge(b5,a5, by = 'SCC')
t5 <- with(q5, tapply(Emissions, year, sum))
d5 <- data.frame(Year= names(t5), Emissions = t5)

png("plot5.png", width=480, height=480)
barplot(height = d5$Emissions, names.arg = d5$Year, ylim = c(0,500),
        col = c('chartreuse','blue4', 'orchid', 'bisque'),
        xlab="Years", ylab='Total PM Emissions',
        main='Total PM emissions from Motor Vehicle Sources in Baltimore City
        for various years')
dev.off()

