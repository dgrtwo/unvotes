library(dplyr)
library(readxl)
library(countrycode)
library(tidyr)
library(devtools)

vlevels <- c("yes", "abstain", "no")

load("data-raw/UNVotesPublished.RData")
un_votes <- x %>%
  tbl_df() %>%
  filter(vote <= 3) %>%
  mutate(country = countrycode(ccode, "cown", "country.name"),
         country_code = countrycode(ccode, "cown", "iso2c")) %>%
  select(rcid, country, country_code, vote) %>%
  mutate(vote = factor(vlevels[vote], levels = vlevels))

devtools::use_data(un_votes, overwrite = TRUE)

descriptions_raw <- read_excel("data-raw/descriptions1-70latestversion.xls")
# transcription error in Excel
descriptions_raw$ec[90] <- 0

un_roll_calls <- descriptions_raw %>%
  select(rcid, session, importantvote:descr) %>%
  mutate(rcid = as.integer(rcid),
         date = as.Date(date)) %>%
  arrange(rcid)

devtools::use_data(un_roll_calls, overwrite = TRUE)

un_roll_call_issues <- descriptions_raw %>%
  select(rcid, me:ec) %>%
  gather(short_name, value, me:ec) %>%
  mutate(rcid = as.integer(rcid),
         value = as.numeric(value)) %>%
  filter(value == 1) %>%
  select(-value) %>%
  mutate(issue = plyr::revalue(short_name,
                               c(me = "Palestinian conflict",
                                 nu = "Nuclear weapons and nuclear material",
                                 co = "Colonialism",
                                 hr = "Human rights",
                                 ec = "Economic development",
                                 di = "Arms control and disarmament")))

devtools::use_data(un_roll_call_issues, overwrite = TRUE)
