library(ggplot2)

data <- read.csv( 'data/browser-usage.data' )

library(reshape2)
data.melt <- melt(data, id.var="Year")

ggplot(data.melt, aes(x = Year, y = value,fill=variable)) +
    geom_bar(stat='identity')
