
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

for(i in DataVector) {
  if(DataVector[i] < 0)
  
}
