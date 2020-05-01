#reset global environment and load required library packages
rm(list = ls())
library(dplyr)
library(ggplot2)
library(stringr)
library(plyr)
library(broom)

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
##DO NOT RUN THIS AGAIN -- generated file ("families_genera_filled.csv") is in GitHub repo
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
  select(family, genus, binomial, NH4, NO3, NO2, PO4, pH, Temp)
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

#validate lines 57 through 59 by calculating means manually for a few families/optima metrics
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

#look at variables of interest across sampled families:

##NOTE: DATA WERE LOG-TRANSFORMED PRIOR TO A WEIGHTED-AVERAGE CALCULATION, BACK-TRANSFORMING NOT POSSIBLE, SEE README

#plot NH4
fam_plotNH4 <- ggplot(meansBy_family, aes(x = family, y = NH4)) + 
  geom_point() +
  labs(x = "Family", y = "log NH4 (mg/L)") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) + #truncates the family names on the x-axis to fit 6 plots onto cowplot more comfortably
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) #rotates and resizes family names on x-axis

#plot NO3
fam_plotNO3 <- ggplot(meansBy_family, aes(x = family, y = NO3)) + 
  geom_point() +
  labs(x = "Family", y = "log NO3 (mg/L)") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#plot NO2
fam_plotNO2 <- ggplot(meansBy_family, aes(x = family, y = NO2)) + 
  geom_point() +
  labs(x = "Family", y = "log NO2 (mg/L)") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#plot pH
fam_plot_pH <- ggplot(meansBy_family, aes(x = family, y = pH)) + 
  geom_point() +
  labs(x = "Family", y = ("log pH")) +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#plot temp
fam_plotTemp <- ggplot(meansBy_family, aes(x = family, y = Temp)) + 
  geom_point() +
  labs(x = "Family", y = "log Temperature (°C)") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#plot PO4
fam_plotPO4 <- ggplot(meansBy_family, aes(x = family, y = PO4)) + 
  geom_point() +
  labs(x = "Family", y = "log PO4 (mg/L") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

#combine plots with title and save combined plot to file
panelPlot <- cowplot::plot_grid(fam_plotNH4, fam_plotNO3, fam_plotNO2, fam_plot_pH, fam_plotTemp, fam_plotPO4, nrow = 3)
ggsave(filename = "EcoOptPanelPlot.png", plot = panelPlot)

#######################
#######################

##STATS and further subsetting

#determine number of representatives in each family, remove those with # of reps < 5
rep_numbers <- optima_sub %>% 
  group_by(family) %>% 
  summarise(n())
MoreThan5 <- subset(rep_numbers, `n()` > 5)
list(MoreThan5)

# filter by families present with more than 5 taxa as seen in output of line 145 (a little magic number-y...)
filteredFamilies <- filter(optima_sub, 
              family %in% c("Bacillariaceae" ,"Cymbellaceae","Fragilariaceae" ,"Gomphonemataceae","Naviculaceae","Stephanodiscaceae") & 
                family %in% c("Bacillariaceae" ,"Cymbellaceae","Fragilariaceae" ,"Gomphonemataceae","Naviculaceae","Stephanodiscaceae"))
#str(filteredFamilies)
#View(filteredFamilies)

#build a new dataframe of random samples of 5 taxa from each of the "MoreThan5" families
Bac <- subset(filteredFamilies, family == "Bacillariaceae")
Cymb <- subset(filteredFamilies, family == "Cymbellaceae")
Frag <- subset(filteredFamilies, family == "Gomphonemataceae")
Navic <- subset(filteredFamilies, family == "Naviculaceae")
Steph <- subset(filteredFamilies, family == "Stephanodiscaceae")

#random samples
BacSample <-  Bac[sample(nrow(Bac), 5), ]
CymbSample <- Cymb[sample(nrow(Cymb), 5), ]
FragSample <- Frag[sample(nrow(Frag), 5), ]
NavicSample <- Navic[sample(nrow(Navic), 5), ]
StephSample <- Steph[sample(nrow(Steph), 5), ]

#combine individual sample dataframes into new dataframe
sampleDF <- rbind.fill(BacSample, CymbSample, FragSample, NavicSample, StephSample)

##run ANOVA on family optima
pHanova <- lm(pH ~ family, sampleDF ) ##  p > 0.05
summary(pHanova)
NO3anova <- lm(NO3 ~ family, sampleDF) ##  p < 0.05, significant
summary(NO3anova)
NO2anova <- lm(NO2 ~ family, sampleDF) ##  p > 0.05
summary(NO2anova)
NH4anova <- lm(NH4 ~ family, sampleDF) ##  p > 0.05
summary(NH4anova)
PO4anova <- lm(PO4 ~ family, sampleDF) ##  p > 0.05
summary(PO4anova)
TempAnova <- lm(Temp ~ family, sampleDF) ##  p > 0.05
summary(TempAnova)

##ANOVA on genus optima
pHanovaG <- lm(pH ~ genus, sampleDF) ##  p > 0.05
summary(pHanovaG)
NO3anovaG <- lm(NO3 ~ genus, sampleDF) ##  p > 0.05
summary(NO3anovaG)
NO2anovaG <- lm(NO2 ~ genus, sampleDF) ##  p > 0.05
summary(NO2anovaG)
NH4anovaG <- lm(NH4 ~ genus, sampleDF) ##  p < 0.05, marginally significant
summary(NH4anovaG)
PO4anovaG <- lm(PO4 ~ genus, sampleDF) ##  p > 0.05
summary(PO4anovaG)
TempAnovaG <- lm(Temp ~ genus, sampleDF) ##  p > 0.05
summary(TempAnovaG)

#######################
#######################

##MORE PLOTS, after subsetting to random samples of 5 (lines 140 through 168)

##plot average NH4 by genus, colored by family, save plot to file
##ANOVA on NH4 by genus (line 141) showed statistical significance
logNH4plot <- ggplot(sampleDF, aes(x = genus, y = NH4, color = family)) + 
  geom_point() +
  labs(x = "Genus", y = "log NH4", title = "log NH4 by diatom genus") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
ggsave(filename = "GenusLevellogNH4.png", plot = logNH4plot)

##boxplot for comparing NO3 by family
boxplotDiatoms <- ggplot(sampleDF) +
  geom_boxplot( aes ( x = family, y = NO3 ) ) +
  labs(x = "Family", y = "log NO3 (mg/L)", title = "log NO3 by diatom family") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
ggsave(filename = "FamilyLevellogNO3_boxplot.png", plot = boxplotDiatoms)

##additional plot for discussion (see README)
extra_boxplot <- ggplot(optima_sub) +
  geom_boxplot( aes ( x = family, y = pH ) ) +
  labs(x = "Family", y = "log pH", title = "log pH by diatom family") +
  scale_x_discrete(label = function(x) stringr::str_trunc(x, 9)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
extra_boxplot
ggsave(filename = "extra_logpH_boxplot.png", plot = extra_boxplot)
