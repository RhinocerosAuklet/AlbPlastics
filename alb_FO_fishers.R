#Fishers exact tests and means for Albatross Plastic Ingestion Dataset
#J. Beck lead PI with M. Finkelstein
#Data owned by Oikonos, 10/10/2025

#Calculated contingency tables as needed. Ignore dataset call-in. Base data in Table S1 and S4.

##Set working directory and import dataset. Test dataset correctly referenced.
##setwd("Z:/Shared/Projects/Plastic Pollution - BioPs/Finkelstein collaborations/2020 Albatross/Ingestion data for manuscript")

##plastics_FO<-read.csv("albatross_plastic_ingestion_final.csv")
##colnames(plastics_FO)

#Libraries. None needed.

#Create contingency datasets. Values represent individuals with ingested plastic present (plastic_yes) or not (plastic_no).
##BFAL in AK
bfAK <- data.frame(
  "plastic_no" = c(9, 35),
  "plastic_yes" = c(3, 22),
  row.names = c("female", "male"),
  stringsAsFactors = FALSE
)
colnames(bfAK) <- c("plastic_no", "plastic_yes")

bfAK

##LAAL in AK
laAK <- data.frame(
  "plastic_no" = c(0, 38),
  "plastic_yes" = c(5, 49),
  row.names = c("female", "male"),
  stringsAsFactors = FALSE
)
colnames(laAK) <- c("plastic_no", "plastic_yes")

laAK

##BFAL in HI, n = 394
bfHI <- data.frame(
  "plastic_no" = c(121, 82),
  "plastic_yes" = c(117, 74),
  row.names = c("female", "male"),
  stringsAsFactors = FALSE
)
colnames(bfHI) <- c("plastic_no", "plastic_yes")

bfHI

##LAAL in HI, n = 190
laHI <- data.frame(
  "plastic_no" = c(19, 46),
  "plastic_yes" = c(49, 76),
  row.names = c("female", "male"),
  stringsAsFactors = FALSE
)
colnames(bfHI) <- c("plastic_no", "plastic_yes")

laHI

##BFAL vs LAAL, all fisheries, all sexes

bfla <- data.frame(
  "plastic_no" = c(247, 103),
  "plastic_yes" = c(216, 179),
  row.names = c("BFAL", "LAAL"),
  stringsAsFactors = FALSE
)
colnames(bfla) <- c("plastic_no", "plastic_yes")

bfla

##proventriculus vs ventriculus, all species, all fisheries, all sexes
pro_ven <- data.frame(
  "plastic_no" = c(585, 407),
  "plastic_yes" = c(160,338),
  row.names = c("proventriculus", "ventriculus"),
  stringsAsFactors = FALSE
)
colnames(pro_ven) <- c("plastic_no", "plastic_yes")

pro_ven

##BFAL proventriculus vs ventriculus
bfpv <- data.frame(
  "plastic_no" = c(376, 283),
  "plastic_yes" = c(87, 180),
  row.names = c("proventriculus", "venriculus"),
  stringsAsFactors = FALSE
)
colnames(bfpv) <- c("plastic_no", "plastic_yes")

bfpv

##LAAL proventriculus vs ventriculus
lapv <- data.frame(
  "plastic_no" = c(209, 124),
  "plastic_yes" = c(73, 158),
  row.names = c("proventriculus", "ventriculus"),
  stringsAsFactors = FALSE
)
colnames(lapv) <- c("plastic_no", "plastic_yes")

lapv

#Within BFAL, is there a difference between male and female %FO from Alaska? Fisher's exact test
testbfAK <- fisher.test(bfAK)
testbfAK


#Within LAAL, is there a difference between male and female %FO from Alaska? Fisher's exact test
testlaAK <- fisher.test(laAK)
testlaAK

#Within BFAL, is there a difference between male and female %FO from Hawaii? Fisher's exact test
testbfHI <- fisher.test(bfHI)
testbfHI

#Within LAAL, is there a difference between male and female %FO from Hawaii? Fisher's exact test
testlaHI <- fisher.test(laHI)
testlaHI

#10.27.25 run of data shows p>.05 for all above comparisons
#If there is no difference between fisheries and sexes, test BFAL against LAAL for all sexes and fisheries combined with fisher's
testbfla <- fisher.test(bfla)
testbfla

#There is no difference between fisheries and sexes, test proventriculus against ventriculus for all species, all sexes and fisheries combined with fisher's
testpro_ven <- fisher.test(pro_ven)
testpro_ven

#BFAL pro vs ven
testbfpv <- fisher.test(bfpv)
testbfpv

#LAAL pro vs ven
testlapv <- fisher.test(lapv)
testlapv

#Holms-Bonferroni adjustments calculated by hand. See table S4.