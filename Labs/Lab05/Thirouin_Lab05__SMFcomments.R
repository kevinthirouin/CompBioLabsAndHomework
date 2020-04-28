
##Part 1:

#1) Create variable x, and if-else statement to check if value is larger than 5
x <- 10

if(x > 5) {
  print("variable x is greater than 5")
} else {
  print("variable x is less than 5")
  # COMMENT FROM SMF: what if x = 5? Then the message isn't quite accurate
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
   # COMMENT FROM SMF: No need to print; gets excessive.
   # COMMENT FROM SMF: I also sugget re-indenting lines 22-30
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
# COMMENT FROM SMF: So, how many is it?
# COMMENT FROM SMF: Also, line 39 isn't quite right; you need a "&" where you have a ","

##2e) create new vector of those values (50-100) from 2d
FiftyToOneHundred <- DataVector[vals50to100]
FiftyToOneHundred

##2f) create a .csv file of the above vector FiftyToOneHundred
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

#################

#3) Import data on CO2 emmisions, and read about the dataset to answer question 3
CO2data <- read.csv(file.choose())
# COMMENT FROM SMF: try to use "/path/to/file/" with read.csv() instead of file.choose() .
# COMMENT FROM SMF: It will make your work easier to reproduce (by yourself) in the future.
head(CO2data)

##3a) find the first year that "Gas" emmisions were non-zero
gasVector <- CO2data$Gas
which(gasVector > 0) #list indices in gasVector which correspond to non-zero (greater than zero) values in order
CO2data[135,] #the first non-zero value from the which() function above was the 135th value, which corresponds to the 135th row in the "CO2data" dataframe
####answer: 1885
# COMMENT FROM SMF: Line 61 is magic number city!  use code in line 60 plus a little more to get
# COMMENT FROM SMF: the answer without a magic number!  Can you see how?

##3b) report the years in which "Total" emmisions were between 200 and 300 million metric tons of carbon
head(CO2data)
Total <- CO2data[["Total"]]
totalSubset <- which(CO2data$Total >= 200, CO2data$Total <= 300)
# COMMENT FROM SMF: need & instead of , in line 69
length(totalSubset) #double check that this isn't the entire dataset -- it was incorrect during a previous iteration of code
totalSubset #print the vector indices that correspond to the "Total" values between 200 and 300
yearSubset <- CO2data$Year[129:263] #make a vector of "Year" rows 129-263
# COMMENT FROM SMF: In line 73, you could have just used totalSubset rather than the magic numbers!

length(yearSubset) #check length
head(yearSubset) #look at first values to get earliest year in which "Total" was between 200 and 300
tail(yearSubset) #look at last set of values to get latest year in which "Total" was between 200 and 300
####answer: total emmisions were between 200 and 300 million metric tons of carbon between the years 1879 and 2013.


##PART 2:

#Lotka-Volterra predator-prey model
n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
# COMMENT FROM SMF: though the equations are correctly written, they should not be written out
# COMMENT FROM SMF: as lines of code to evaluate here (lines 85-86).  Instead, they could
# COMMENT FROM SMF: be comments.

#Goal: calculate abundances of predators and prey over time using this model

#1)
##define parameter values (copied from Sam's Github lab handout)
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

#2)
##create time vector and make two additional vectors for storage of results
t <- seq(1, totalGenerations) #time vector


##
#work still in progress. pushing to Github for grading purposes.
##
























