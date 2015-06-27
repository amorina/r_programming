View(iris)
data <- iris[,-5]
class <- iris[,5]

# running kmeans; number of clusters known
results <- kmeans(data, 3)
results
results$size
results$cluster

table(class,results$cluster)
plot(data$Petal.Length,data$Petal.Width,col=results$cluster)
plot(data$Petal.Length,data$Petal.Width,col=class)
plot(data$Sepal.Length, data$Sepal.Width,col=results$cluster)
plot(data$Sepal.Length, data$Sepal.Width,col=class)
