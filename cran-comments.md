# Changes

* Updated data to 2017-01-17 version in dataverse, which contains UN votes up to the end of 2015.
* Countries are now in line with the newest version of the countrycode package, which includes changing "United States"" to "United States of America" and "United Kingdom" to "United Kingdom of Great Britain and Northern Ireland". To keep this from restricting analyses, there is now also a country_code column with the ISO 2 character country code.
* Changed order of levels of un_votes$vote factor from 1 = abstain, 2 = no, 3 = yes to 1 = yes, 2 = abstain, 3 = no.

## Test environments
* local OS X install, R 3.3.2
* ubuntu 12.04 (on travis-ci), R 3.3.0
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

No reverse dependencies.
