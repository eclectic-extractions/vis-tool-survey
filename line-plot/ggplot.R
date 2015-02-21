library(ggplot2)

data <- data.frame( x = -50:50 )
data$y <- data$x ^ 2

p <- ggplot(data, aes( x=x, y=y ))
show( p + geom_line() )

