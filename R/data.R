#' United Nations General Assembly voting data by country and roll call
#'
#' Information on the voting history of the United Nations General Assembly.
#' Contains one row for each country-vote pair.
#'
#' @format A data frame (specifically a tbl_df) with one row
#' for each country-vote pair, and the following columns:
#' \describe{
#'   \item{rcid}{The roll call id; used to join with \code{\link{un_roll_calls}}
#'   and \code{\link{un_roll_call_issues}}}
#'   \item{vote}{Vote result as a factor of yes/abstain/no}
#'   \item{country}{Country name, by official English short name (ISO)}
#' }
#'
#' @details The original data included cases where a country was absent
#' or was not yet a member. In this dataset these were filtered out to
#' include only votes of Yes, Abstain, and No
#'
#' Country name can be converted to other unique country identifiers
#' (such as 2-character or 3-character ISO codes) using the
#' \link[countrycode]{countrycode} function from the countrycode
#' package.
#'
#' @examples
#'
#' library(dplyr)
#'
#' # percentage yes by country
#' by_country <- un_votes %>%
#'   group_by(country) %>%
#'   summarize(votes = n(),
#'             percent_yes = mean(vote == 1))
#'
#' arrange(by_country, percent_yes)
#' arrange(by_country, desc(percent_yes))
#'
#' # combine with per-vote information
#' un_votes %>%
#'   inner_join(un_roll_calls, by = "rcid")
#'
#' # combine with issue
#' votes_issues <- un_votes %>%
#'   inner_join(un_roll_call_issues, by = "rcid")
#'
#' # for example, which countries voted yes least often on Colonialism
#' votes_issues %>%
#'   filter(issue == "Colonialism") %>%
#'   group_by(country) %>%
#'   summarize(percent_yes = mean(vote == 1)) %>%
#'   arrange(percent_yes)
#'
#' @source Erik Voeten "Data and Analyses of Voting in the UN General Assembly"
#'  Routledge Handbook of International Organization, edited by Bob Reinalda
#'   (published May 27, 2013)
#'   \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=hdl:1902.1/12379}
"un_votes"


#' Data on each roll call of the United Nations General Assembly
#'
#' Information on each roll call vote of the United Nations General Assembly.
#'
#' @format A data frame (specifically a tbl_df) with one row
#' for each roll call vote, and the following columns:
#' \describe{
#'   \item{rcid}{The roll call id; used to join with \code{\link{un_votes}}
#'   and \code{\link{un_roll_call_issues}}}
#'   \item{session}{Session number. The UN holds one session per year; these
#'   started in 1946}
#'   \item{importantvote}{Whether the vote was classified as important by the
#'   U.S. State Department report "Voting Practices in the United Nations".
#'   These classifications began with session 39}
#'   \item{date}{Date of the vote, as a Date vector}
#'   \item{unres}{Resolution code}
#'   \item{amend}{Whether the vote was on an amendment; coded only until
#'   1985}
#'   \item{para}{Whether the vote was only on a paragraph and not a resolution;
#'   coded only until 1985}
#'   \item{short}{Short description}
#'   \item{descr}{Longer description}
#' }
#'
#' @details The yes, no, and abstain columns that were present in the original
#' Voeten data were removed (since they can be retrieved from the
#' \code{\link{un_votes}} dataset)
#'
#' @examples
#'
#' library(dplyr)
#'
#' # combine with per-country-vote information
#' un_votes %>%
#'   inner_join(un_roll_calls, by = "rcid")
#'
#' @source Erik Voeten "Data and Analyses of Voting in the UN General Assembly"
#'  Routledge Handbook of International Organization, edited by Bob Reinalda
#'   (published May 27, 2013)
#'   \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=hdl:1902.1/12379}
"un_roll_calls"


#' Data on the issue of each roll call of the United Nations General Assembly
#'
#' Issue (topic) classifications of roll call votes of the United Nations
#' General Assembly. Many votes had no topic, and some have more than one.
#'
#' @format A data frame (specifically a tbl_df) with one row
#' for each pair of a roll call vote and an issue describing that vote.
#' Contains the following columns:
#' \describe{
#'   \item{rcid}{The roll call id; used to join with \code{\link{un_votes}}
#'   and \code{\link{un_roll_calls}}}
#'   \item{short_name}{Two-letter issue codes}
#'   \item{issue}{Descriptive issue name}
#' }
#'
#' @source Erik Voeten "Data and Analyses of Voting in the UN General Assembly"
#'  Routledge Handbook of International Organization, edited by Bob Reinalda
#'   (published May 27, 2013)
#'   \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=hdl:1902.1/12379}
"un_roll_call_issues"
