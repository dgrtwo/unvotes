library(dplyr)
library(readxl)
library(countrycode)
library(tidyr)
library(forcats)
library(usethis)

vlevels <- c("yes", "abstain", "no")

load("data-raw/UNVotes2021.RData")

un_votes <- completeVotes %>%
  filter(vote <= 3) %>%
  mutate(
    country = countrycode(ccode, "cown", "country.name"),
    country_code = countrycode(ccode, "cown", "iso2c"),
    # Match based on old version of data from unvotes package
    country_code = case_when(
      country == "Czechoslovakia" ~ "CS",
      country == "Yugoslavia" ~ "YU",
      country == "German Democratic Republic" ~ "DD",
      country == "Yemen People's Republic" ~ "YD",
      TRUE ~ country_code
    ),
    country = if_else(!is.na(Countryname) & Countryname == "German Federal Republic", "Federal Republic of Germany", country)
  ) %>%
  select(rcid, country, country_code, vote) %>%
  mutate(vote = as.character(vote)) %>%
  mutate(vote = fct_recode(vote, yes = "1", abstain = "2", no = "3"))

usethis::use_data(un_votes, overwrite = TRUE)

descriptions <- completeVotes %>%
  select(session, rcid, abstain, yes, no, importantvote, date, unres, amend, para, short, descr, me, nu, di, hr, co, ec) %>%
  distinct(rcid, .keep_all = TRUE)

un_roll_calls <- descriptions %>%
  select(rcid, session, importantvote:descr) %>%
  mutate(rcid = as.integer(rcid),
         date = as.Date(date)) %>%
  arrange(rcid)

usethis::use_data(un_roll_calls, overwrite = TRUE)

un_roll_call_issues <- descriptions %>%
  select(rcid, me:ec) %>%
  gather(short_name, value, me:ec) %>%
  mutate(rcid = as.integer(rcid),
         value = as.numeric(value)) %>%
  filter(value == 1) %>%
  select(-value) %>%
  mutate(issue = fct_recode(short_name,
                            "Palestinian conflict" = "me",
                            "Nuclear weapons and nuclear material" = "nu",
                            "Colonialism" = "co",
                            "Human rights" = "hr",
                            "Economic development" = "ec",
                            "Arms control and disarmament" = "di"))

usethis::use_data(un_roll_call_issues, overwrite = TRUE)

