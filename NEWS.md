# unvotes 0.2.0

* Updated data to 2017-01-17 version in dataverse, which contains UN votes up to the end of 2015.
* Countries are now in line with the newest version of the countrycode package, which includes changing "United States"" to "United States of America" and "United Kingdom" to "United Kingdom of Great Britain and Northern Ireland". To keep this from restricting analyses, there is now also a country_code column with the ISO 2 character country code.
* Changed order of levels of un_votes$vote factor from 1 = abstain, 2 = no, 3 = yes to 1 = yes, 2 = abstain, 3 = no.
* Moved README figures to the tools/ directory.

# unvotes 0.1.0

* Initial draft of package, with three datasets, data-raw folder, a vignette, and README
