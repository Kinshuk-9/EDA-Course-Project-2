
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

q2 <- NEI[NEI$fips == '24510',]
t2 <- with(q2, tapply(Emissions, year, sum))
d2 <- data.frame(Year = names(t2), Emissions = t2)


png("plot2.png", width=480, height=480)

barplot(height = d2$Emissions, names.arg=d2$Year,
        col = c('chartreuse','blue4', 'orchid', 'bisque'), xlab="Years", 
        ylab='total PM emission',
        main='Total PM emissions in Baltimore City, Maryland for various years')
dev.off()

