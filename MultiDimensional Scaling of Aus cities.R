# followed exercise from http://www.r-bloggers.com/multidimensional-scaling-mds-with-r/
# importing dissimilarities matrix from rosetta.reltech.org
dist.au <- read.csv("http://rosetta.reltech.org/TC/v15/Mapping/data/dist-Aus.csv")

# remove column of cities names and set colnames to corresponding city names
row.names(dist.au) <- dist.au[,1]
dist.au <- dist.au[, -1]

run Multidimensional Scaling
fit <- cmdscale(dist.au, eig = TRUE, k = 2)
fit
x <- fit$points[,1]
y <- fit$points[,2]

#visualize the data with a plot
plot(x,y)
city.names <- c("Adelaide", "Alice Springs", "Brisebane", "Darwin", "Hobart", "Melbourne", "Perth", "Sydney")
text(x, y, labels = city.names)
x <- 0 - x
y <- 0 - y
plot(x, y, pch = 19, xlim = range(x) + c(0, 600))
text(x, y, pos = 4, labels = city.names)
