#' Calculate LSG
#'
#' @param dataset Dataset you want to use to calculate the LSG
#' @param crit_to_4plus Vector with the names of the critical indicators coded from 1 to 5.
#' @param crit_to_4 Vector with the names of the critical indicators coded from 1 to 4.
#' @param crit_to_3 Vector with the names of the critical indicators coded from 1 to 3.
#' @param non_crit Name of the non-critical indicator
#'
#' @return A numeric vector with the LSG score from 1 to 5 (or maximum).
#' @export
#'
#' @examples
#' make_lsg(dummy_dataset,
#'          crit_to_4plus = c("crit1_4plus", "crit2_4plus"),
#'          crit_to_4 = c("crit1_4", "crit2_4"),
#'          crit_to_3 = c("crit1_3", "crit2_3"),
#'          non_crit = "crit1_nc")
#'

make_lsg <- function(
    dataset = dataset,
    crit_to_4plus = NULL,
    crit_to_4 = NULL,
    crit_to_3 = NULL,
    non_crit = NULL) {

  #if there is at least a 4+ score indicator
  if(!is.null(crit_to_4plus)) {
    indicator_to_select <- c(crit_to_4plus, crit_to_4, crit_to_3, non_crit)

    if(sum(dataset[indicator_to_select] > 5, na.rm = T) > 0) {
      stop("Cannot have values equals above 5")
    }

    make_single_lsg(dataset = dataset,
              max_indicator = crit_to_4plus,
              indicator_to_select = indicator_to_select)

  } else if (!is.null(crit_to_4)){ #if there is at least 4 score indicator
    indicator_to_select <- c(crit_to_4, crit_to_3, non_crit)

    if(sum(dataset[indicator_to_select] > 4, na.rm = T) > 0) {
      stop("You don't have 4+ indicators, values cannot be above 4")
    }

    make_single_lsg(dataset = dataset,
              max_indicator = crit_to_4,
              indicator_to_select = indicator_to_select)
  } else {
    indicator_to_select <- c(crit_to_3, non_crit)

    if(sum(dataset[indicator_to_select] > 3, na.rm = T) > 0) {
      stop("You don't have indicators scoring 4, values cannot be above 3")
    }

    make_single_lsg(dataset = dataset,
              max_indicator = c(crit_to_3, non_crit),
              indicator_to_select = indicator_to_select)
  }
}

#' Calculate LSG. This function is made to be used in the make_lsg.
#'
#' @param dataset Dataset you want to use to calculate the LSG
#' @param max_indicator Vector with all the names of the variables with the maximum score
#' @param indicator_to_select Vector with all the names of the variables that compose the LSG (score from 1 to 5)
#'
#' @return A numeric vector with the LSG score 1 to the maximum score.
#' @export
#'
#' @examples
#' make_single_lsg(dataset = dummy_dataset,
#'                 max_indicator = c("crit1_4plus", "crit2_4plus"),
#'                 indicator_to_select = c("crit1_4plus", "crit2_4plus", "crit1_4", "crit2_4", "crit1_3", "crit2_3", "crit1_nc"))
#'

make_single_lsg <- function(dataset,
                            max_indicator,
                            indicator_to_select) {
  if(any(sapply(dataset[indicator_to_select], function(xx) !is.numeric(xx)))) {
    stop("all columns must be numeric")
  }
  if(sum(dataset == 0, na.rm = T) > 0) {
    stop("Cannot have values equals to 0")
  }

  dataset[, indicator_to_select] |>
    apply(1, FUN = function(xx) {
      #check if missing the maximum indicator has missing values to return NA
      if(is.infinite(max(xx[max_indicator], na.rm = T))) {
        NA_integer_
      } else { #else return the max.
        xx |> max(na.rm = T)
      }
    })
}
