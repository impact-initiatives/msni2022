
# msni2022

<!-- badges: start -->
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
         crit_to_4plus = c("crit1_4plus", "crit2_4plus"),
         crit_to_4 = c("crit1_4", "crit2_4"),
         crit_to_3 = c("crit1_3", "crit2_3"),
         non_crit = "crit1_nc")
```

