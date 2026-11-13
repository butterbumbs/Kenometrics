#
#
#
#
#
#
#
# clean and libs
library(tidyverse)
library(sf)

turndf1 <- read.csv("73586e35-290d-431c-94ba-5cf8a97c4ae5.csv")

turndf <- turndf1 %>%
  filter(
    YEAR >= 2025
  ) %>%
    select(YEAR, PROVINCE_ID, PROVINCE_E, GENDER_E, AGE_GROUP_ID, AGE_GROUP_E, VOTES, ELIGIBLE_ELECTORS, TURNOUT_ELIGIBLE_ELECTOR)


unique(turndf$AGE_GROUP_E)

turndf <- turndf %>%
  filter(PROVINCE_E != "Canada", AGE_GROUP_E != "All ages"
  )



votedata <- turndf %>%
    select(PROVINCE_E, GENDER_E, AGE_GROUP_E, TURNOUT_ELIGIBLE_ELECTOR)

votedata <- votedata %>%
    mutate(
        AGE_GROUP_E = case_when(
            AGE_GROUP_E %in% c("First time", "Not first time") ~ "18 to 24 years",
            .default = AGE_GROUP_E
        )   
    )

unique(votedata$TURNOUT_ELIGIBLE_ELECTOR)

plot(votedata$PROVINCE_E, votedata$TURNOUT_ELIGIBLE_ELECTOR)
#
#
#
#
provinces <- st_read("lpr_000b21a_e.shp")
provmapdt <- 
#
#
#
