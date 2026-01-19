#Stacked bar plot of proportions of plastic by category by species and stomach section (BW & color options)
#J. Beck lead PI with M. Finkelstein
#Data owned by Oikonos, 12/15/2025

#Set working directory and import dataset. Test dataset correctly referenced.
setwd("Z:/Shared/Projects/Plastic Pollution - BioPs/Finkelstein collaborations/2020 Albatross/Ingestion data for manuscript")

#Proportion (by weight) of categories of plastic ingested by Laysan (LAAL) and black-footed albatross (BFAL).
##Calculated from Table S2.
figs1<-read.csv("plastic_ingestion_data_facet_FigSI.csv")
colnames(figs1)

#Import libraries
library(tidyverse)
library(ggplot2)
library(ggpattern)
library(viridis)

#Order Plastic.Type levels
figs1$Subcategory <- factor(figs1$Plastic.Type, levels = c("Sheet", "Foam", "Line", "Pellet", "Post Consumer Hard"))

# Stacked bar plot - bw version if using in main manuscript
p_bw<-ggplot(figs1, aes(fill = Subcategory, y = Percent, x = Species_Stom)) + 
  geom_bar(position="stack", colour="black", linewidth = 0.2, stat="identity") +
  scale_fill_grey(start=0, end=.9) + 
  labs(x = "Stomach Section",
       y = "Percent",
       fill = "Plastic Category") +
  facet_wrap(~Species)+
  theme_bw()
p_bw

#Save - fix dimensions
ggsave("FigS1_bw_percent.png", plot = p_bw, path = "Z:/Shared/Projects/Plastic Pollution - BioPs/Finkelstein collaborations/2020 Albatross/Ingestion data for manuscript", width = 8.5, height = 5, dpi = 300)


#Color version - if using in SI
p_color<-ggplot(figs1, aes(fill = Subcategory, y = Proportion, x = Species_Stom)) + 
  geom_bar(position="stack", colour="black", linewidth = 0.2, stat="identity") +
  scale_fill_viridis_d(option = "E")+
  #scale_fill_manual(values = c("Post Consumer Hard" = "skyblue1","Pellet" = "paleturquoise", "Line" = "palegreen", "Foam" = "khaki", "Sheet" = "lightpink1" )) +
  labs(x = "Stomach Section",
       y = "Proportion",
       fill = "Plastic Category") +
  facet_wrap(~Species)+
  theme_bw()
p_color

#Save - fix dimensions
ggsave("FigS1_color.png", plot = p_color, path = "Z:/Shared/Projects/Plastic Pollution - BioPs/Finkelstein collaborations/2020 Albatross/Ingestion data for manuscript", width = 8.5, height = 4, dpi = 300)
