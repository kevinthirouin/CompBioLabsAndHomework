#Lab 12 - some more ggplot()

#Problem 1

#use ggplot to make a plot based on the Cusack et al data (from lab 9)
##first, import dataset:
camTrap <- read.csv("C:/Users/kevin/Google Drive/GraduateSchool_EBIO/Coursework/SPRING_2020/Computational_Biology/CompBioLabsAndHomework/Labs/Lab12/Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv")
head(camTrap)

##plot species by count using ggplot()
library("ggplot2")
ggplot(camTrap, aes(Species))
















































