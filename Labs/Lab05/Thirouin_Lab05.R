
##Part 1:

#1) Create variable x, and if-else statement to check if value is larger than 5
x <- 10

if(x > 5) {
  print("variable x is greater than 5")
} else {
  print("variable x is less than 5")
}

#####################

#2) Import ExampleData.csv file
ExampleData <- read.csv(file.choose()) #Import ExampleData.csv file
str(ExampleData) #check structure of data -- data frame of one variable
DataVector <- ExampleData$x #move data into a vector for manipulation

##2a) create a for loop to change every negative value in the DataVector to NA
for(i in 1:length(DataVector)) {
 if(DataVector[i] >= 0) {
 print(DataVector[i])
} else {
  DataVector[i] <- NA
}
}

##2b) change all "NA" values from 2a to "NaN"
DataVector[is.na(DataVector)] <- NaN

##2c) determine how many values in imported data fall between 50 and 100 (inclusive of 50 and 100)
DataVector[is.nan(DataVector)] <- 0

##2d) determine how many values in DataVector fall between 50 and 100
vals50to100 <- which(DataVector >= 50, DataVector <= 100)

##2e) create new vector of those values (50-100) from 2d
FiftyToOneHundred <- DataVector[vals50to100]
FiftyToOneHundred

##2f) create a .csv file of the above vector FiftyToOneHundred
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

#################

#3) Import data on CO2 emmisions, and read about the dataset to answer question 3
CO2data <- read.csv(file.choose())
head(CO2data)

##3a) find the first year that "Gas" emmisions were non-zero
gasVector <- CO2data$Gas
which(gasVector > 0) #list indices in gasVector which correspond to non-zero (greater than zero) values in order
CO2data[135,] #the first non-zero value from the which() function above was the 135th value, which corresponds to the 135th row in the "CO2data" dataframe
####answer: 1885

##3b) 
