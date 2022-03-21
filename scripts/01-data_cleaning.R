#### Preamble ####
# Purpose: Clean the survey data downloaded from GSS
# Author: Ziyu Jiang, Yizeng Wang, Zifeng Zhu 
# Data: 20 March 2021
# Contact: ziyu.jiang@mail.utoronto.ca, kerry.wang@mail.utoronto.ca, zifeng.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(tidyverse)
# Read in the raw data. 
data <- read_csv("Social Identity Dataset.csv")
# Just keep some variables that may be of interest and filter out the values
# that is not 
data_cleaned_new <- data %>%
  select(agegr10, sex, livarr06, icr_30, cwr_40, cwf_60, grp_40, mcr_310,
         prd_10, wfr_510, dh1ged, sbl_500, discrim, srh_115, relig7, incm) %>%
  filter(!(sbl_500 == 5 | sbl_500 == 7 |
             sbl_500 == 8|sbl_500 == 9)) %>%
  filter(!(livarr06 == 6)) %>%
  filter(!(icr_30 == 96 | icr_30 == 97 | icr_30 == 98)) %>%
  filter(!(cwr_40 == 6 | cwr_40 == 7| cwr_40 == 8)) %>%
  filter(!(cwf_60 == 6 | cwf_60 == 7 | cwf_60 == 8 | cwf_60 == 9)) %>%
  filter(!(grp_40 == 6 | grp_40 == 7 | grp_40 == 8)) %>%
  filter(!(mcr_310 == 7 | mcr_310 == 8)) %>%
  filter(!(prd_10 == 6 | prd_10 == 7 | prd_10 == 97 | prd_10 == 98)) %>%
  filter(!(wfr_510 == 6 | wfr_510 == 7 | wfr_510 == 8 | wfr_510 == 9)) %>%
  filter(!(dh1ged == 9)) %>%
  filter(!(discrim == 7 | discrim == 8 | discrim == 9)) %>%
  filter(!(srh_115 == 7 | srh_115 == 8 | srh_115 == 9)) %>%
  filter(!(relig7 == 97 | relig7 == 98 | relig7 == 99)) %>%
  filter(!(incm == 97 | incm == 98 | incm == 99)) %>%
  mutate(sbl_500_level = case_when(sbl_500 == 1 | sbl_500 == 2 ~ "1", 
                                   sbl_500 == 3 | sbl_500 == 4 ~ "0"))
#### What's next? ####



         