#lab step 3: numbers of chip bags and guests for star wars party
chips <- 5
guests <- 8

#lab step 5: average number of chip bags per guest (expected)
avg_chips <- 0.4

#lab step 7: calculate leftover chips, with additional 0.4 bags consumed
leftoverChips <- chips - ((guests * avg_chips) + avg_chips)


#PART II

#lab step 8: make vector of movie rankings for self, and each friend
self <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
penny <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
lenny <- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
stewie <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)

#lab step 9: Penny's rank for Episode IV
PennyIV <- penny[4]

#lab step 10: concatenate rankings into single data object
movieRankings <- cbind(self, penny, lenny, stewie)

#lab step 11:
str(PennyIV) #prints only the fourth number in the vector: 3.
str(penny) #prints the entire vector of numbers representing Penny's movie rankings

#lab step 12: make data frame from the above matrix of movie rankings using two methods
#method 1:
rankings_dataframe1 <- data.frame(self, penny, lenny, stewie)
print(rankings_dataframe1)
#method 2:
rankings_dataframe2 <- as.data.frame(movieRankings)
print(rankings_dataframe2)

#lab step 13: differences between step 12 (dataframes) and step 10 (matrix):
dim(movieRankings)
dim(rankings_dataframe1)
dim(rankings_dataframe2)
  #all outputs of dim() are the same for objects from steps 10 and 12
str(movieRankings)
str(rankings_dataframe1)
str(rankings_dataframe2)
  #rankings from step 10 are in a matrix with no useful column header information, while the dataframes (both) have more useful header information
typeof(movieRankings) #output: "double"
typeof(rankings_dataframe1) #output: "list"
typeof(rankings_dataframe2) #output: "list"
  #output of matrix is "double", and output of dataframe is "list"

#lab step 14: vector of star wars episode names
episodes <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

#lab step 15: add row names to dataframes
row.names(movieRankings) <- episodes
row.names(rankings_dataframe1) <- episodes
row.names(rankings_dataframe2) <- episodes

#lab step 16: print row three from step 10 matrix
print(movieRankings[, 3])

#lab step 17: print column four from step 12 dataframe
print(rankings_dataframe1[4])

#lab step 18: print self ranking for episode V
print(rankings_dataframe1[5,1])

#lab step 19: print penny's ranking for episode II
print(rankings_dataframe1[2,2])

#lab step 20: print all rankings for episodes IV-VI
print(rankings_dataframe1[ c(4,5,6), ])

#lab step 21: print all rankings for episodes II, V, and VII
print(rankings_dataframe1[ c(2,5,7), ])

#lab step 22: print episodes IV and VI for penny and stewie
rankings_dataframe1[ c(4,6), c(2,4) ]

#lab step 23: swap lenny's rankings for episodes II and V
rankings_dataframe1
lenny_2 <- rankings_dataframe1[2,3]
lenny_5 <- rankings_dataframe1[5,3]

rankings_dataframe1[5,3] <- lenny_2
rankings_dataframe1[2,3] <- lenny_5
rankings_dataframe1 #print dataframe after lenny's swap

#lab step 24: access penny's ranking using column and row names (try with step 10 matrix as well as step 12 dataframe)
movieRankings["III", "penny"]
rankings_dataframe1["III", "penny"]

#lab step 25: undo step 23 swap using names rather than index numbers
rankings_dataframe1["V", "lenny"] <- lenny_5
rankings_dataframe1["II", "lenny"] <- lenny_2
rankings_dataframe1

#lab step 26: redo lenny's switch using "$" operator
rankings_dataframe1
rankings_dataframe1$lenny[5] <- lenny_2
rankings_dataframe1$lenny[2] <- lenny_5
rankings_dataframe1