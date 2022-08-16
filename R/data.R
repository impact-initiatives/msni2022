#' Dummy dataset for LSG test and creation representing all possible combination
#' with 2 critical indicators with value from 1 to 5 and NA,
#' with 2 critical indicators with value from 1 to 4 and NA,
#' with 2 critical indicators with value from 1 to 3 and NA,
#' with 1 non critical indicators with value from 1 to 3 and NA.
#'
#' @format A data frame with 57600 rows and 7 variables:
#' \describe{
#'   \item{crit1_4plus}{critical indicator from 1 to 5}
#'   \item{crit2_4plus}{critical indicator from 1 to 5}
#'   \item{crit1_4}{critical indicator from 1 to 4}
#'   \item{crit2_4}{critical indicator from 1 to 4}
#'   \item{crit1_3}{critical indicator from 1 to 3}
#'   \item{crit2_3}{critical indicator from 1 to 3}
#'   \item{crit1_nc}{critical indicator from 1 to 3}
#'
#' }
#'
#'
#' You can reproduce with the following code
#' dummy_dataset <- expand.grid(crit1_4plus = c(1:5, NA),
#'                              crit2_4plus = c(1:5, NA),
#'                              crit1_4 = c(1:4, NA),
#'                              crit2_4 = c(1:4, NA),
#'                              crit1_3 = c(1:3, NA),
#'                              crit2_3 = c(1:3, NA),
#'                              crit1_nc = c(1:3, NA))
"dummy_dataset"
