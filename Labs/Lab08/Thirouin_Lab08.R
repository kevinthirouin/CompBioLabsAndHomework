#Lab 8

##1) Markdown tutorial complete

##2) Rewrote README for the repo using StackEdit 

###

##3) Logistic growth model function

logGrowthModel <- function(r, K, totalGen, init_pop) {
  LogGrowth <- rep(init_pop, totalGen)
  for(i in 2:length(LogGrowth)) {
    LogGrowth[i] <- LogGrowth[i-1] + (r * LogGrowth[i-1] * (K - LogGrowth[i-1]) / K)
  }
  Abundance <- (LogGrowth)
  Time <- c(1:totalGen)
  Generations <- c(1:totalGen)
  plot(Time, Abundance, xlab = "Time (Generations)")
  datatable <- cbind(Generations, Abundance)
  write.csv(datatable, "c:/users/kevin/Google Drive/GraduateSchool_EBIO/Coursework/SPRING_2020/Computational_Biology/CompBioLabsAndHomework/Labs/Lab08/LogisticGrowthTable.csv")
  return(LogGrowth)
}

logGrowthModel(.08, 10000, 12, 2500)