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
#'   \item{vote}{Vote result, with 1 = yes, 2 = abstain, and 3 = no}
#'   \item{country}{Country name, by official English short name (ISO)}
#' }
#'
#' @details Country name can be converted to other unique country identifiers
#' (such as 2-character or 3-character ISO codes) using the
#' \link[countrycode]{countrycode} function from the countrycode
#' package.
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
#'   \item{vote}{Session number. The UN holds one session per year; these
#'   started in 1946}
#'   \item{importantvote}{Whether the vote was classified as important by the
#'   U.S. State Department report "Voting Practices in the United Nations".
#'   These classifications began with session 39}
#'   \item{date}{Date of the vote, as a Date vector}
#'   \item{amend}{Whether the vote was on an amendment; coded only until
#'   1985}
#'   \item{para}{Whether the vote was only on a paragraph and not a resolution;
#'   coded only until 1985}
#'   \item{short}{Short description}
#'   \item{descr}{Longer description}
#' }
#'
#' @details Country name can be converted to other unique country identifiers
#' (such as 2-character or 3-character ISO codes) using the
#' \link[countrycode]{countrycode} function from the countrycode
#' package.
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
#' @details Country name can be converted to other unique country identifiers
#' (such as 2-character or 3-character ISO codes) using the
#' \link[countrycode]{countrycode} function from the countrycode
#' package.
#'
#' @source Erik Voeten "Data and Analyses of Voting in the UN General Assembly"
#'  Routledge Handbook of International Organization, edited by Bob Reinalda
#'   (published May 27, 2013)
#'   \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=hdl:1902.1/12379}
"un_roll_call_issues"

