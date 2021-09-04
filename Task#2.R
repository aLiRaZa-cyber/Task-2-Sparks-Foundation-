#Read the iris datasets

# for read the iris datasets, read the datasets package is mandatory

library(datasets)
#install.packages("factoextra")
library(ggplot2)
library(factoextra) #library ggplot2 also recquired for factoetra

# call iris datasets
data("iris")

#view the uper row of iris datasets

head(iris)

#to check the detail of data sets
summary(iris)

# to read / check the total number of rows and columns
dim(iris)

#to check the attributes of the iris data.
attributes(iris)
#$names - It shows names of columns of iris data
#$class - it shows data type of iris
#$row.names - It represents row numbers

#we can also check the selective attibutes of data like
# to check columns
attr(iris, "names")
#to check data types
attr(iris, "class")

# lebel save in other form
iris.labels = iris$Species
# to check the distribution
table(iris.labels)

# Now I am wemoving the species for creating the cluster because cluster or kmeans
# are working or noo-categorized data

iris_data <- iris[1:4]

head(iris_data)

#find Optimum Cluster or determine the value of k

iris_data_scale <- scale(iris_data)
set.seed(8593)
#calculate how many cluster you need
#with in sumsquares

# fviz_nbclust(): Dertemines and visualize the optimal number of clusters using different methods: within cluster sums of squares, average silhouette and gap statistics.
#"wss" (for total within sum of square)
fviz_nbclust(iris_data_scale, kmeans , method = "wss") +
  labs(subtitle = "The elbow method")
# we choose the value of k is 3

#now I am making 3 clusters, because I already know for sure there are three species, this would be totally different process if I would not now particular count of clusters
(kmeans.result <- kmeans(iris_data, 3))

table(iris.labels, kmeans.result$cluster)

#visualizing
attr(iris_data, "names")

plot(iris_data[c("Sepal.Length" , "Sepal.Width")], 
     col = kmeans.result$cluster, pch = 20 )

library(cluster)
#install fpc packages
library(fpc)

plotcluster(iris_data_scale,kmeans.result$cluster)


clusplot(iris_data_scale,kmeans.result$cluster, color = TRUE, shade = TRUE)
