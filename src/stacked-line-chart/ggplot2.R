library(ggplot2)

# <https://stackoverflow.com/questions/13022299/specify-date-format-for-colclasses-argument-in-read-table-read-csv>
setAs("character","yyyy", function(from) as.POSIXct(from, format="%Y"))
data <- read.csv( 'data/browser-usage.data', colClasses = c( Year = "yyyy" ) )

library(reshape2)
data.melt <- melt(data, id.var="Year")
print(data)
print(summary(data))

p <- ggplot(data.melt, aes(x = Year, y = value, fill = variable))
show( p + geom_area() )
