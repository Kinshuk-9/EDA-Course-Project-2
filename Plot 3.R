library(ggplot2)
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

t3 <- with(q2, tapply(Emissions, list(type,year), sum))
d3 <- melt(t3)
colnames(d3) <- c('Type','Year','Emissions')
plot3 <- ggplot(d3, aes(x = factor(Year), y = Emissions, fill = Type)) + 
  geom_bar(stat = "identity") + facet_grid(. ~ Type) + 
  labs(title = 'Total PM Emission in Baltimore by Source', 
       x = 'Year', y='Total Emission') 


png("plot3.png", width=640, height=480)
print(plot3)
dev.off()

