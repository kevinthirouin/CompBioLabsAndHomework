#Lab 4


#Basic for loop syntax:
#for( i in sequence ) { # note that "sequence" is some kind of vector
#command1	
#command2	
#...		
#}

##Part 1: practice writing "for loops"

#1) use a for loop to print "hi" 10 times in the console

for(i in seq(1,10)) {
  print("hi")
}

#2) Tim's allowance

vec <- rep(0, 8) #set up an empty vector of length 8 (for 8 weeks) to store values in

for(i in vec) {
  output[i] = vec[i] + 5 - (1.34*2)
}
