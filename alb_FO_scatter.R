#Correlations, Fig1, Fig3, and Kruskal-Willis for Albatross Plastic Ingestion FO and Weight Dataset
#J. Beck lead PI with M. Finkelstein
#Data owned by Oikonos, 10/10/2025

#Set working directory
setwd("Z:/Shared/Projects/Plastic Pollution - BioPs/Finkelstein collaborations/2020 Albatross/Ingestion data for manuscript")


#Import dataset. Test dataset correctly referenced.
##plastics_fig1 data set is %F0 of ingested plastic by species by stomach section (pro, ven, combined pro+ven)
plastics_fig1<-read.csv("plastics_data_fig1_barchart.csv")
colnames(plastics_fig1)
plastics_FO_yr<-read.csv("plastic_ingestion_FOpercentage_species_year.csv")
colnames(plastics_FO_yr)

#Libraries
library(ggplot2)
library(dplyr)

#Fig 1. What is the percent FO for each species by stomach section?
fig1<-ggplot(plastics_fig1, aes(x = stom_section, y = percent_FO, fill = Species)) +
  geom_col(position = "dodge", width = .7, colour="black", linewidth = 0.3) +
  scale_fill_manual(values = c("black", "gray70")) +
  labs(x = "Stomach Section", y = "% Frequency of Occurrence") +
  theme_classic()+
  ylim(0, 100)
fig1

#Save Fig 1.
ggsave("Fig1.png", plot = fig1, path = "Z:/Shared/Projects/Plastic Pollution - BioPs/Finkelstein collaborations/2020 Albatross/Ingestion data for manuscript", width = 5, height = 4, dpi = 300)


#Fig 3. Scatter plot of % Frequency of Occurrence of ingested plastic by species by year, 2010-2018
# (dropped the only 2019 bird from the plastics_FO_yr dataset - 1 BFAL with plastic)
p<-ggplot(plastics_FO_yr, aes(x=CollYear, y=TotIncidencePercent, shape=Species, color = Species)) + 
  geom_smooth(method = "lm", linetype = "dashed", linewidth = 0.5, se = FALSE) +
  geom_point(color = "black", size = 2)+
  geom_text(aes(label=TotIncidencePercent), 
    nudge_x = 0.16, nudge_y = 1.9, 
    check_overlap = T, size = 2.5)+
  scale_color_manual(values = c("BFAL" = "grey41", "LAAL" = "black"))+
  theme_classic() +
  ylab("% Frequency of Occurrence") +
  xlab("Year")+
  ylim(0,100)+
  theme(legend.position = "none")+
  scale_x_continuous(breaks = min(plastics_FO_yr$CollYear):max(plastics_FO_yr$CollYear))+
  scale_shape_manual(values = c(21, 19))

p

#Save Fig 3.
ggsave("Fig3.png", plot = p, path = "Z:/Shared/Projects/Plastic Pollution - BioPs/Finkelstein collaborations/2020 Albatross/Ingestion data for manuscript", width = 5.5, height = 4, dpi = 300)

#Subset species into 2 datasets for separate Spearman's correlations
BFAL_data <- subset(plastics_FO_yr, subset = Species == "BFAL")
LAAL_data <- subset(plastics_FO_yr, subset = Species == "LAAL")

#Spearman's correlation for BFAL and LAAL
BFALmod<-cor.test(BFAL_data$CollYear, BFAL_data$TotIncidencePercent, method = "spearman", exact = FALSE)
BFALmod

LAALmod<-cor.test(LAAL_data$CollYear, LAAL_data$TotIncidencePercent, method = "spearman", exact = FALSE)
LAALmod

#Test effect of year and total weight of ingested plastic for each species
#Bring back in plastic weight data (not log transformed) and subset by species
plastics_FO<-read.csv("albatross_plastic_ingestion_weighed_final.csv")
colnames(plastics_FO)

BFAL_data_weight <- subset(plastics_FO, subset = species == "BFAL")

LAAL_data_weight <- subset(plastics_FO, subset = species == "LAAL")


#Kruskal-wallis for both species
kruskal.test(combined_total_wt ~ year_collected, data = BFAL_data_weight)

kruskal.test(combined_total_wt ~ year_collected, data = LAAL_data_weight)

