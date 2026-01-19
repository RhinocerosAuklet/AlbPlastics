#2-way ANOVA on transformed FO Albatross Plastic Ingestion Dataset, followed post-hoc pairwise comparisons and means
#J. Beck lead PI with M. Finkelstein
#Data owned by Oikonos, 10/10/2025

#Set working directory and import dataset. Test dataset correctly referenced.
setwd("Z:/Shared/Projects/PlasticPollution - BioPs/Finkelstein collaborations/2020 Albatross/Ingestion data for manuscript")

#Read in log-adjusted plastic weights by species and category.
##This is each plastic weight by category for every bird that was weighed. Proventriculus and ventriculus are combined.
##1.5 is added to each weight by category and bird, then log10 adjusted.
plastics<-read.csv("aov_albatross_plastic_ingestion_1.5log_weighed_final.csv")

#Import libraries
library(ggplot2)
library(emmeans)

#Box plot LAAL vs BFAL different plastic types. How similar are the two samples (species)?
plastic_type_plot<-ggplot(plastics) +
  aes(x = Combined_Plastic_type, y = Log1.5_weight) +
  scale_y_log10() + 
  geom_boxplot() +
  facet_wrap(~species)+
  theme_bw() +
  ylab("Log weight (g)") +
  xlab("Plastic category")

plastic_type_plot

#Save and print box plot
ggsave("boxplot.png", plot = plastic_type_plot, path = "Z:/Shared/Projects/Plastic Pollution - BioPs/Finkelstein collaborations/2020 Albatross/Ingestion data for manuscript", width = 8, height = 4, dpi = 300)


#First, use 2-way ANOVA to determine if there is a significant difference among 3 or more groups
mod<-aov(Log1.5_weight ~ Combined_Plastic_type + species,
    data = plastics
)

#Print 2-way ANOVA results
summary(mod)

#Post hoc pairwise comparisons
# Get estimated marginal means and all pairwise comparisons for the 'Combined_Plastic_type' factor with species interaction
# This uses the +1.5 log weights in the aov model
emmeans_results <- emmeans(mod, pairwise ~ Combined_Plastic_type | species, adjust = "tukey")

# View the results
print(emmeans_results)
