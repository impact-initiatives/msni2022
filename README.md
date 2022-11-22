
# msni2022

<!-- badges: start -->
[![check-standard](https://github.com/impact-initiatives/msni2022/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/impact-initiatives/msni2022/actions/workflows/check-standard.yaml)
[![Codecov test coverage](https://codecov.io/gh/impact-initiatives/msni2022/branch/main/graph/badge.svg)](https://app.codecov.io/gh/impact-initiatives/msni2022?branch=main)
<!-- badges: end -->

The goal of msni2022 is to help create the Living Standard Gaps for the Multi Sector Needs Index

## Installation

You can install the released version of msni2022 from [github](https://github.com/) with:

``` r
devtools::install_github("https://github.com/impact-initiatives/msni2022")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(msni2022)
make_lsg(dummy_dataset,
         crit_to_4plus = c("crit1_4plus", "crit2_4plus"), #vector with the names all of indicators that have the critical indicators that score from 1 to 5 (5 is 4+)
         crit_to_4 = c("crit1_4", "crit2_4"), #vector with the names all of indicators that have the critical indicators that score from 1 to 4
         crit_to_3 = c("crit1_3", "crit2_3"), #vector with the names all of indicators that have the critical indicators that score from 1 to 3
         non_crit = "crit1_nc") #name of the column with the non critical composite that scores from 1 to 3
         
dummy_dataset$lsg_score <- make_lsg(dummy_dataset,
                                    crit_to_4plus = c("crit1_4plus", "crit2_4plus"),
                                    crit_to_4 = c("crit1_4", "crit2_4"), 
                                    crit_to_3 = c("crit1_3", "crit2_3"), 
                                    non_crit = "crit1_nc") 

dummy_dataset |> View()

#without 4+
dummy_no4plus <- dummy_dataset[, c("crit1_4", "crit2_4", "crit1_3", "crit2_3", "crit1_nc")] |>
  unique()
dummy_no4plus$lsg_score <- make_lsg(dummy_no4plus,
                                    crit_to_4 = c("crit1_4", "crit2_4"), 
                                    crit_to_3 = c("crit1_3", "crit2_3"), 
                                    non_crit = "crit1_nc") 

dummy_no4plus |> View()

```

