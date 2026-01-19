Stats and Visualizations for Beck and Finkelstein et al. 2026
"Plastic ingestion and potential for endocrine disruption in two North Pacific albatross species"

PROJECT
Black-footed (n=463) and Laysan albatross (n=282) were opportunistically collected by federal fisheries observers 2010-2019.
Carcasses were necropsied and demographics (age, sex) and frequency of occurance (FO) of ingested plastics was documented.
A random subset of samples (BFAL=145, LAAL=105) had plastics weighed by bird, stomach section, and plastic type.
A subset of the weighed plastic samples (n=51) were tested for the capacity to exhibit estrogenic or anti-estrogenic properties.

DATA
All base data can be found in SI materials online. Dataframes configured for analysis were not included in SI, but described in code for replication.
Table S1 -> FO dataset
Table S2 -> weighed plastic dataset
Table S3 -> results of endocrine disruption experiments
Table S4 -> Contigency tables for fishers tests, results and Holm-Bonferroni adjusted α

CODE
alb_aov_posthocs
Covers 2-way ANOVA on transformed FO data, post-hoc pairwaise comparisons and means. Includes Fig. 2 boxplot.

alb_FO_fishers
Fishers exact tests and means using data in Table S4

alb_FO_scatter
Spearman's correlations for FO annual trends, Kruskal-Wallis and calculations, and Figs. 1 and 3. Results reported in mainuscript text.

FigS1
Code for S1 bar graph, black and white and color versions. (Color version mildly horrible).
