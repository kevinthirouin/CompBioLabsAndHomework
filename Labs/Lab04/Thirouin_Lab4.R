#Lab 4

rm(list = ls()) #clear memory for new R session)

###
##Part 1: practice writing "for loops"
###


#1) use a for loop to print "hi" 10 times in the console

for(i in seq(1,10)) {
  print("hi")
}

#2) Tim's allowance

#Parameters:
initial_cash <- 10 #Tim's starting money
weekly_allowance <- 5 #Tim's weekly allowance
gum_spending <- (1.34*2) #How much Tim spends on gum each week
n_weeks <- 8

#print 8 weeks of Tim's assets
for(i in  1:n_weeks) {
  newWeek <- initial_cash + weekly_allowance - gum_spending
  initial_cash <- newWeek
  print(newWeek)
}


#3) Conservation biology

#Parameters:
initial_pop <- 2000 #current population size
rate_pop_decline <- 0.95 #population decline of 5% per year
per_year <- seq(from = 1, to = 7, by = 1)

#Calculations, vectorized over time vector (as shown in Sam's lecture slides)
expected_pop <- initial_pop * (rate_pop_decline ^ per_year)
expected_pop #print results


#4) Predicting values from the discrete-time logistic growth equation

#Define parameters
n <- seq(0, 12) #vector
n[1] <- 2500 #population abundance at timestep 1
K <- 10000 #population carrying capacity
r <- 0.8 #intrinsic growth rate of population

#loop -- NOTE: for some reason, putting the print(i) or print(n) function
#inside the for loop does not seem to output the vector in the correct format
#so I moved the print functions outside the loop

for(i in 2:length(n)) {
  n[i] <- n[i-1] + ( r * n[i-1] * ( K - n[i-1]) / K )
}
print(i)
print(n)
print(n[12])

###
##Part 2: Practice writing for loops and storing data in arrays
###

#5) Practice basics of array indexing with for loops

#5a)
vec_18 <- rep(0 , 18) #make vector of 18 zeros
vec_18 #print new vector in console

#5b)
for(i in seq(1 , 18)) {
  vec_18[i] <- i * 3  #multiply the ith element of the vector by 3
}
print(vec_18)

#5c)
newVec1 <- rep(0 , 18)  #make new vector of 18 zeros
newVec1[1] <- 1  #replace the first element of the vector with 1
print(newVec1)

#5d)

#loop over newVec1 values, starting with the second value
#add 1 and multiply the previous entry by 2, for
#each iteration (for each value in newVec1 affected by the loop)

for(i in 2:length(newVec1)) {
  newVec1[i] <-  (newVec1[i-1] * 2) + 1
}
print(newVec1)


#6) Fibonacci sequence

#make a vector of 20 zeros to store Fibonacci numbers in
fibVec <- rep(0, 20)
print(fibVec)

fibVec[2] <- 1

for(i in 3:length(fibVec)) {
  fibVec[i] <- (fibVec[i-2] + fibVec[i-1])
}
print(fibVec)


#7) Storing values and plotting data from question 4

#make 12 step time vector, empty storage vector for abundance, and define parameters
time <- seq(1,12)
abundance <- seq(1, 12) #vector of abundances
abundance[1] <- 2500 #population abundance at timestep 1
carryingCap <- 10000 #population carrying capacity
growthRate <- 0.8 #intrinsic growth rate of population

#loop
for(i in 2:length(abundance)) {
  abundance[i] <- abundance[i-1] + ( growthRate * abundance[i-1] * ( carryingCap - abundance[i-1]) / K )
}
print(abundance)

#plot abundance over time
plot(time, abundance)