<!-- README.md is generated from README.Rmd. Please edit that file -->



## United Nations General Assembly Voting Data

This package provides the voting history of countries in the [United Nations General Assembly](http://www.un.org/en/ga/), along with information such as date, description, and topics for each vote.

These come from the dataset [found here](https://dataverse.harvard.edu/dataset.xhtml?persistentId=hdl:1902.1/12379):

Erik Voeten "Data and Analyses of Voting in the UN General Assembly" Routledge Handbook of International Organization, edited by Bob Reinalda (published May 27, 2013)

This raw data, and the processing script, can be found in the [data-raw](data-raw) folder.

### Installation

Install the package using [devtools](https://github.com/hadley/devtools) with:


```r
devtools::install_github("dgrtwo/unvotes")
```

### Datasets

The package contains three datasets. First is the history of each country's vote. These are represented in the `un_votes` dataset, with one row for each country-roll call pair:


```r
library(unvotes)
#> Error in library(unvotes): there is no package called 'unvotes'

un_votes
#> Error in eval(expr, envir, enclos): object 'un_votes' not found
```

The package also contains a dataset of information about each 


```r
un_roll_calls
#> Error in eval(expr, envir, enclos): object 'un_roll_calls' not found
```

Finally, there is a dataset with connections of each vote to 6 issues:


```r
un_roll_call_issues
#> Error in eval(expr, envir, enclos): object 'un_roll_call_issues' not found

library(dplyr)
count(un_roll_call_issues, issue, sort = TRUE)
#> Error in group_by_(x, .dots = vars, add = TRUE): object 'un_roll_call_issues' not found
```

(Use `help()` to get information and documentation about each dataset).

### Example analysis

Many useful analyses will first involve joining the vote and roll call datasets by the shared `rcid` (roll call ID) column:


```r
library(dplyr)

joined <- un_votes %>%
  inner_join(un_roll_calls, by = "rcid")
#> Error in eval(expr, envir, enclos): object 'un_votes' not found

joined
#> Error in eval(expr, envir, enclos): object 'joined' not found
```

One could then count how often each country votes "yes" on a resolution in each year:


```r
library(lubridate)

by_country_year <- joined %>%
  group_by(year = year(date), country) %>%
  summarize(votes = n(),
            percent_yes = mean(vote == "yes"))
#> Error in eval(expr, envir, enclos): object 'joined' not found

by_country_year
#> Error in eval(expr, envir, enclos): object 'by_country_year' not found
```

After which this can be visualized for one or more countries:


```r
library(ggplot2)
theme_set(theme_bw())

countries <- c("United States", "United Kingdom", "India", "France")

# there were fewer votes in 2013
by_country_year %>%
  filter(country %in% countries, year <= 2013) %>%
  ggplot(aes(year, percent_yes, color = country)) +
  geom_line() +
  ylab("% of votes that are 'Yes'")
#> Error in eval(expr, envir, enclos): object 'by_country_year' not found
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
