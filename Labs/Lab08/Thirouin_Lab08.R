#Lab 8

##3) Logistic growth model function

#setup storage vectors
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

##function
logisticGrowth <- function()










  







