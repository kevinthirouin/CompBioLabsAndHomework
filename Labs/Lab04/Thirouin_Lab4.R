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
n <- seq(0, 12) #empty vector
n[1] <- 2500
K <- 10000
r <- 0.8

#loop
for(i in 2:length(n)) {
  n[i] <- n[i-1] + ( r * n[i-1] * ( K - n[i-1]) / K )
  print(i)
  print(n)
}

###
##Part 2: Practice writing for loops and storing data in arrays
###

#5) Practice basics of array indexing with for loops

#5a)
vec_18 <- rep(0, 18) #make vector of 18 zeros
vec_18 #print new vector in console

#5b)
for(i in seq(1,18)) {
  vec_18 <- 
}


















