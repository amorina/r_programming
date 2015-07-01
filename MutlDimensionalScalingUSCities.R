# creating dissimilarity matrix
atlanta <- c(0, 587, 1212, 701, 1936, 604, 748, 2139, 2182, 543)
chicago <- c(587, 0, 920, 940, 1745, 1188, 713, 1858, 1737, 597)
denver <- c(1212, 920, 0, 879, 831, 1726, 1631, 949, 1021, 1494)
houston <- c(701, 940, 879, 0, 1374, 968, 1420, 1645, 1891, 1220)
los_angeles <- c(1936, 1745, 831, 1374, 0, 2339, 2451, 347, 959, 2300)
miami <- c(604, 1188, 1726, 968, 2339, 0, 1092, 2594, 2734, 923)
nyc <- c(748, 713, 1631, 1420, 2451, 1092, 0, 2571, 2408, 205)
san_francisco <- c(2139, 1858, 949, 1645, 347, 2594, 2571, 0, 678, 2442)
seattle <- c(2182, 1737, 1021, 1891, 959, 2734, 2408, 678, 0, 2329)
DC <- c(543, 597, 1494, 1220, 2300, 923, 205, 2442, 2329, 0)

dist <- data.frame( atlanta, chicago, denver, houston, los_angeles, miami, nyc, san_francisco, seattle, DC)
dist

fit <- cmdscale(dist, eig = TRUE, k = 2)
x <- fit$points[ ,1]
y <- fit$points[ ,2]
plot(x, y, pch = 19, xlim = range(x) + c(0, 600))
city.names <- row.names(dist)
text(x, y, pos = 4, labels = city.names)

# only shoes relative distance; orientation is not corret
# must invert axes
x <- 0  - x
y <- 0 - y
plot(x, y, pch = 19, xlim = range(x) + c(5, 500))
text(x, y, pos = 4, labels = city.names)

# our final result is a failry accurate representation of the United States