library("recommenderlab")
library(caTools)
Book <- read.csv("Book.csv")
View(Book)
attach(Book)
str(Book)
### EDA ###
hist(Book.Rating)
boxplot(Book.Rating)

## Datatype should be realRatingMatrix inorder to build recommendation engine
Book_Matrix <- as(Book,'realRatingMatrix')

## Applying Popularity based Recommendation Engine ##
Book_Reco_Model <- Recommender(Book_Matrix,method="POPULAR")

## Predictions
recommended_items <- predict(Book_Reco_Model, Book_Matrix[1], n=3)
as(recommended_items, "list")
## Popularity Model recommends the book with ratimgs of 8,9,& 10 ##

## To check whether there is improvement in model User Based Collaborative Filtering ##
install.packages("IBCF.MTME")
library(IBCF.MTME)

Book_Reco_Model1 <- Reco+-mmender(Book_Matrix,method="UBCF")
recommended_items1 <- predict(Book_Reco_Model1, Book_Matrix[1], n=3)
as(recommended_items1, "list")
## UBCF Model also recommends the book with ratimgs of 8,9,& 10 ##