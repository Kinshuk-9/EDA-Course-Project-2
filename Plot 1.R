
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


t1 <- with(NEI, tapply(Emissions, year, sum))
d1 <- data.frame(Year = names(t1), Emissions = t1)


png("plot1.png", width=480, height=480)

barplot(height = d1$Emissions/1000000, names.arg = d1$Year,ylim = c(0,10),
        col = c('chartreuse','blue4', 'orchid', 'bisque'),
        xlab="Years", ylab='Total PM Emissions in megatons',
        main='Total PM emissions for various years')

dev.off()