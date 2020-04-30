#reset global environment and load required library packages
rm(list = ls())
library(dplyr)
library(ggplot2)
library(stringr)
install.packages("ggdraw")

#set working directory and import ecological optima dataset from Keck et al
setwd("C:/Users/kevin/Google Drive/GraduateSchool_EBIO/Coursework/SPRING_2020/Computational_Biology/CompBioLabsAndHomework/IndProject/")
Keck_Optima <- read.csv("Data_Ecol_Optima_original.csv", stringsAsFactors = F)

#rename species column header to be more descriptive and make new column with only genus names
colnames(Keck_Optima)[1] <- c("binomial")
#take first word (genus name) from Keck_Optima$species and replace spaces in binomial names with underscores
Keck_Optima$genus <- word(Keck_Optima$binomial, 1)
Keck_Optima$binomial <- gsub(" ", "_", Keck_Optima$binomial)
#head(Keck_Optima)


#############################

##
##DO NOT RUN THIS AGAIN:
#get list of genera from newly generated column (from line 17) and export as a .csv
    ##write.csv(Keck_Optima$genus, file = "families_genera.csv", row.names = F) #NOTE: this keeps all instances of repeated genera to retain number of rows for re-import in line 27

###
##add family names using MS Excel, referencing DiatomBase.org, into new column of the .csv file. Renamed column header while in Excel
###

#############################


#import newly generated family character strings
families_genera <- read.csv("families_genera_filled.csv", stringsAsFactors = F)
#str(families_genera)

#add family data into a column in main Keck_Optima dataframe
Keck_Optima$family <- families_genera$family
#head(Keck_Optima)

#reorder variable columns and subset the dataframe to include only taxon names and ecological variables of interest: NH4, NO3, NO2, NKJ, PO4, Mg2, pH, Temp, Cond, K, Na
optima_sub <- Keck_Optima %>%
  select(family, genus, binomial, NH4, NO3, NO2, NKJ, PO4, Mg2, pH, Temp, Cond, K, Na)
#head(optima_sub)

#explore and identify families
##length(unique(optima_sub$family))
##unique(optima_sub$family)

#make a new dataframe that has the mean optima values for each genus, and another for each family
meansBy_genus <- optima_sub %>%
  group_by(genus) %>%
  summarise_if(is.numeric, mean)
    #View(meansBy_genus)

meansBy_family <- optima_sub %>% 
  group_by(family) %>% 
  summarise_if(is.numeric, mean) #summarise_if with is.numeric argument ignores variables of character strings (i.e., "family", "genus", "binomial")
    #View(meansBy_family)

###################################

##Working by family:

#validate by calculating means manually for a few families/optima metrics
mean_Naviculaceae <- optima_sub %>%
  filter(family == "Naviculaceae")
meanNH4_Naviculaceae <- mean(mean_Naviculaceae$NH4)
meanNH4_Naviculaceae #confirmed value matches value in meansBy_family
meanNO3_Naviculaceae <- mean(mean_Naviculaceae$NO3)
meanNO3_Naviculaceae #confirmed value matches value in meansBy_family
    #View(meansBy_family)

mean_Cymbellaceae <- optima_sub %>%
  filter(family == "Cymbellaceae")
mean_pH_Cymbellaceae <- mean(mean_Cymbellaceae$pH) 
mean_pH_Cymbellaceae
mean_pH_Cymbellaceae == meansBy_family$pH[7] #returns TRUE
    #pH[7] is the average pH value for the Cymbellaceae in meansBy_family
    #View(meansBy_family)


#get an "eyeball" look at variables of interest across sampled families:

##NOTE: DATA WERE LOG-TRANSFORMED PRIOR TO A WEIGHTED-AVERAGE CALCULATION, BACK-TRANSFORMING NOT POSSIBLE##

#plot NH4
fam_plotNH4 <- ggplot(meansBy_family, aes(x = family, y = NH4)) + 
  geom_point() +
  labs(x = "Family", y = "NH4 (mg/L)") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) + #truncates the family names on the x-axis to fit 6 plots onto cowplot more comfortably
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) #rotates and resizes family names on x-axis

#plot NO3
fam_plotNO3 <- ggplot(meansBy_family, aes(x = family, y = NO3)) + 
  geom_point() +
  labs(x = "Family", y = "NO3 (mg/L)") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#plot NO2
fam_plotNO2 <- ggplot(meansBy_family, aes(x = family, y = NO2)) + 
  geom_point() +
  labs(x = "Family", y = "NO2 (mg/L)") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#plot pH
fam_plot_pH <- ggplot(meansBy_family, aes(x = family, y = pH)) + 
  geom_point() +
  labs(x = "Family", y = ("pH")) +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#plot temp
fam_plotTemp <- ggplot(meansBy_family, aes(x = family, y = Temp)) + 
  geom_point() +
  labs(x = "Family", y = "Temperature (°C)") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#plot PO4
fam_plotPO4 <- ggplot(meansBy_family, aes(x = family, y = PO4)) + 
  geom_point() +
  labs(x = "Family", y = "PO4 (mg/L") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#combine plots with title and save combined plot to file
panelPlot <- cowplot::plot_grid(fam_plotNH4, fam_plotNO3, fam_plotNO2, fam_plot_pH, fam_plotTemp, fam_plotPO4, nrow = 3)
ggsave(filename = "EcoOptPanelPlot.jpg", plot = panelPlot)


#######################

##run ANOVA on family optima, and decide which relationships to plot at generic level based on that

#ANOVA:

##WORKING...

#######################


##plot average optima by genus, colored by family

#WORKING ON THIS...
ggplot(optima_sub, aes(x = genus, y = pH, color = family)) + 
  geom_point() +
  labs(x = "Genus", y = "log pH") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))


#remove 


##BOXPLOT for comparing family optima values (MUST have adequate genus-level representation,
#                                             so omit families that have fewer than (x) genera)
ggplot(optima_sub) +
  geom_boxplot( aes ( x = family, y = ?? ) ) + #placeholder for later
  labs(x = "Family", y = "variable") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))















##extra stuff

#list the number of taxa representing each family
#str_count(meansBy_family$family, "Achnanthidiaceae")

#length(meansBy_family[which(meansBy_family$family == "Achnanthidiaceae")])

##check data structure, change character strings to factors
#str(optima_sub)
#optima_sub$family <- as.factor(optima_sub$family)
#optima_sub$genus <- as.factor(optima_sub$genus)
#optima_sub$binomial <- as.factor(optima_sub$binomial)


