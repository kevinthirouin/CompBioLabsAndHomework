#Lab 7 : "Put the FUN in FUNction!"


##Writing Your Own Functions, Part 1

##
#Problem 1: write a function to calculate and return the area of a triangle when given the base and height as arguments
##

##write function that will calculate the area of a triangle given the triangle's base and height
triangleArea <- function(base, height) {
  area <- 0.5 * base * height
  return(area)
}

##define base and height of imaginary triangle
base <- 10
height <- 9

##apply function from above to defined variables "base" and "height"
triangleArea(base, height)

##
#Problem 2: write a function to report absolute values of individual values, and then all elements of a vector
##

##2a) write function to report single absolute value of an element
myAbs <- function(x) {
  x_sq <- x^2
  absolute <- sqrt(x_sq)
  return(absolute)
}
myAbs(-1.5) #check that the function works as intended with a test

##2b) revise the above function to work on all elements of a vector
vec1 <- c(1.1, 2, 0, -4.3, 9, -12) #given vector to use new function on

###write function that will report the absolute values of all elements in a vector
myAbsVector <- function(myVector) {
  absolute <- sqrt(myVector^2) 
  return(absolute)
  }
myAbsVector(vec1)

##
#Problem 3: Fibonacci Sequence -- return a vector of the first n Fibonacci numbers, where n is any integer greater than or equal to 3
##

fibFunc <- function(n, startVal) {
  fibVec <- rep(startVal, n)
  for(i in startVal:length(fibVec)) {
    fibVec[i] <- (fibVec[i - 2] + fibVec[i - 1])
  }
  return(fibVec)
}
fibFunc(30, 0)


##
#Problem 4 
##

##4a) write a function that takes two arguments and returns the square of the difference between them.

##function
squareDiff_Func <- function(x, y) {
  Diff <- (x - y)
  sqDiff <- (Diff ^2)
  return(sqDiff)
}

##demonstrate function viability on the numbers 3 and 5
squareDiff_Func(3, 5)

##call squareDiff_Func with a vector as the first argument
squareDiff_Func(c(2, 4, 6), 4)  #shows how R vectorizes functions

##4b) write a function that calculates the average of a vector of numbers

##function
meanFunc <- function(myVector) {
  meanVector <- (sum(myVector) / length(myVector))
}

##show that function works with a vector
print(meanFunc(c(5, 15, 10)))

##demonstrate function use with provided dataset ("DataForLab07.csv")
###import dataset and explore how the data are organized
dataLab07 <- read.csv(file.choose())  #NOTE TO SELF: modify this method -- some difficulty dealing with Google Drive directory, since 'Google Drive' has a space in it. Will resolve somehow
str(dataLab07)
head(dataLab07)

###make variable 'x' from dataframe recognizable as a vector to R
Lab07_Vector <- as.vector(dataLab07$x)
str(Lab07_Vector) #check that this worked with str() function

###call meanFunc() function to calculate mean of Lab07_Vector
print(meanFunc(Lab07_Vector))

##4c) sum of squares function
sosFunc <- function(myVector) {
  mean <- meanFunc(myVector) #calculates the mean of the values in the given vector
  sqDiffs <- squareDiff_Func(myVector, mean) #subtracts the vector mean from each datapoint in the vector, and squares each of those values
  sos <- sum(sqDiffs) #takes the sum of all the squared differences output from the previous line
  return(sos)
}

###test function on Lab07 dataset
sosFunc(Lab07_Vector)






