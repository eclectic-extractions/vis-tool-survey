library(ggplot2)
p <- ggplot(mtcars, aes(factor(gear)))
print( p + geom_bar() )
