##Lab for Week 11: More data filtering, subsetting, summarizing, and plotting

#Part1: Import data after downloading from DataDryad

#import dataset
woodData <- read.csv("C:/Users/kevin/Google Drive/GraduateSchool_EBIO/Coursework/SPRING_2020/Computational_Biology/CompBioLabsAndHomework/Labs/Lab11/GlobalWoodDensityDatabase.csv", stringsAsFactors = F)
head(woodData)
str(woodData)

#rename wood density data column in dataframe with more convenient name
colnames(woodData)[4] <- "Density_gcm3"
#check that worked
colnames(woodData)

##find occurences of NAs in the dataframe
#assign NAs to new object
woodData_NAs <- is.na(woodData$Density_gcm3) 


#4) Removing rows with missing data

##4a) find row(s) with NAs in the Density_gcm3 column
Density_NA <- which(is.na(woodData$Density_gcm3))

##4b) remove NA
woodData <- woodData[-Density_NA, ]


#5) Dealing with one kind of pseudo-replication

#call dplyr package
library(dplyr)

#Starting with "woodData" - make a new dataframe that:
#         has each species listed only once
#         has the Family and Binomial information for each species
#         has the mean of the Density measurements for each species
meanDensityDF <- woodData %>%
  group_by(Binomial, Family) %>%
  summarise(binomialMeanDensity = mean(Density_gcm3), n())

##BONUS 5) validate the above code by solving in another way

#
#
#


#6) Contrasting most and least dense families

##6a) starting with "meanDensityDF" from above - make another new dataframe that has average density for each Family (and no longer has individual species)
familyDensityDF <- meanDensityDF %>%
  group_by(Family) %>%
  summarise(familyMeanDensity = mean(binomialMeanDensity), n())

##6b) Sort the result of 6a by MeanDensity and store that sorted result in a data frame
sortedFamilyDensity <- arrange(familyDensityDF, familyMeanDensity)

##6c)
###What are the 8 families with the highest average densities?
topEightFamilyDensities <- nrow()


###What are the 8 families with the lowest average densities?






































