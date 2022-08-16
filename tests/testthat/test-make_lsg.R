test_that("Takes the max when variables are NULL", {
  dataframe_for_test <- data.frame(crit1_4plus = 5,
                                   crit2_4plus = 4,
                                   crit1_4 = 3,
                                   crit2_4 = 1,
                                   crit1_3 = 2,
                                   crit2_3 = 1,
                                   crit1_nc = 1)
  expect_equal(make_lsg(dataframe_for_test,
                        crit_to_4plus = c("crit1_4plus", "crit2_4plus"),
                        crit_to_4 = c("crit1_4", "crit2_4"),
                        crit_to_3 = c("crit1_3", "crit2_3"),
                        non_crit = "crit1_nc"),
               5)
  expect_equal(make_lsg(dataframe_for_test,
                        crit_to_4 = c("crit1_4", "crit2_4"),
                        crit_to_3 = c("crit1_3", "crit2_3"),
                        non_crit = "crit1_nc"),
               3)
  expect_equal(make_lsg(dataframe_for_test,
                        crit_to_3 = c("crit1_3", "crit2_3"),
                        non_crit = "crit1_nc"),
               2)

})

test_that("Tests for one NA", {
  dataframe_for_test <- data.frame(crit1_4plus = NA_integer_,
                                   crit2_4plus = 4,
                                   crit1_4 = NA_integer_,
                                   crit2_4 = 3,
                                   crit1_3 = NA_integer_,
                                   crit2_3 = NA_integer_,
                                   crit1_nc = 1)
  expect_equal(make_lsg(dataframe_for_test,
                        crit_to_4plus = c("crit1_4plus", "crit2_4plus"),
                        crit_to_4 = c("crit1_4", "crit2_4"),
                        crit_to_3 = c("crit1_3", "crit2_3"),
                        non_crit = "crit1_nc"),
               4)
  expect_equal(make_lsg(dataframe_for_test,
                        crit_to_4 = c("crit1_4", "crit2_4"),
                        crit_to_3 = c("crit1_3", "crit2_3"),
                        non_crit = "crit1_nc"),
               3)
  expect_equal(make_lsg(dataframe_for_test,
                        crit_to_3 = c("crit1_3", "crit2_3"),
                        non_crit = "crit1_nc"),
               1)

})

test_that("Tests for all NA", {
  dataframe_for_test <- data.frame(crit1_4plus = NA_integer_,
                                   crit2_4plus = NA_integer_,
                                   crit1_4 = NA_integer_,
                                   crit2_4 = NA_integer_,
                                   crit1_3 = NA_integer_,
                                   crit2_3 = NA_integer_,
                                   crit1_nc = NA_integer_)
  expect_warning(make_lsg(dataframe_for_test,
                        crit_to_4plus = c("crit1_4plus", "crit2_4plus"),
                        crit_to_4 = c("crit1_4", "crit2_4"),
                        crit_to_3 = c("crit1_3", "crit2_3"),
                        non_crit = "crit1_nc"),
               NA_integer_)
  expect_warning(make_lsg(dataframe_for_test,
                        crit_to_4 = c("crit1_4", "crit2_4"),
                        crit_to_3 = c("crit1_3", "crit2_3"),
                        non_crit = "crit1_nc"),
               NA_integer_)
  expect_warning(make_lsg(dataframe_for_test,
                        crit_to_3 = c("crit1_3", "crit2_3"),
                        non_crit = "crit1_nc"),
               NA_integer_)
})

test_that("Tests for all NA", {
  dataframe_for_test <- data.frame(crit1_4plus = NA_integer_,
                                   crit2_4plus = NA_integer_,
                                   crit1_4 = 4,
                                   crit2_4 = 3,
                                   crit1_3 = 2,
                                   crit2_3 = 1,
                                   crit1_nc = 1)
  expect_warning(make_lsg(dataframe_for_test,
                          crit_to_4plus = c("crit1_4plus", "crit2_4plus"),
                          crit_to_4 = c("crit1_4", "crit2_4"),
                          crit_to_3 = c("crit1_3", "crit2_3"),
                          non_crit = "crit1_nc"),
                 NA_integer_)
  dataframe_for_test <- data.frame(crit1_4 = NA_integer_,
                                   crit2_4 = NA_integer_,
                                   crit1_3 = 2,
                                   crit2_3 = 1,
                                   crit1_nc = 1)
  expect_warning(make_lsg(dataframe_for_test,
                          crit_to_4 = c("crit1_4", "crit2_4"),
                          crit_to_3 = c("crit1_3", "crit2_3"),
                          non_crit = "crit1_nc"),
                 NA_integer_)
  dataframe_for_test <- data.frame(crit1_3 = NA_integer_,
                                   crit2_3 = NA_integer_,
                                   crit1_nc = NA_integer_)
  expect_warning(make_lsg(dataframe_for_test,
                          crit_to_3 = c("crit1_3", "crit2_3"),
                          non_crit = "crit1_nc"),
                 NA_integer_)
})


test_that("Inputing character", {
  dataframe_for_test <- data.frame(crit1_4plus = "4+",
                                   crit1_4 = 4,
                                   crit1_3 = 2,
                                   crit1_nc = 1)
  expect_error(make_lsg(dataframe_for_test,
                          crit_to_4plus = c("crit1_4plus"),
                          crit_to_4 = c("crit1_4"),
                          crit_to_3 = c("crit1_3"),
                          non_crit = "crit1_nc"),
               "all columns must be numeric")
})

test_that("Inputing wrong values (0 or above 5)", {
  dataframe_for_test <- data.frame(crit1_4plus = 5,
                                   crit1_4 = 4,
                                   crit1_3 = 6,
                                   crit1_nc = 1)
  expect_error(make_lsg(dataframe_for_test,
                        crit_to_4plus = c("crit1_4plus"),
                        crit_to_4 = c("crit1_4"),
                        crit_to_3 = c("crit1_3"),
                        non_crit = "crit1_nc"),
               "Cannot have values equals above 5")
  dataframe_for_test <- data.frame(crit1_4plus = 5,
                                   crit1_4 = 4,
                                   crit1_3 = 2,
                                   crit1_nc = 0)
  expect_error(make_lsg(dataframe_for_test,
                        crit_to_4plus = c("crit1_4plus"),
                        crit_to_4 = c("crit1_4"),
                        crit_to_3 = c("crit1_3"),
                        non_crit = "crit1_nc"),
               "Cannot have values equals to 0")
  dataframe_for_test <- data.frame(crit1_4plus = 0,
                                   crit1_4 = 4,
                                   crit1_3 = 2,
                                   crit1_nc = 1)
  expect_equal(make_lsg(dataframe_for_test,
                        crit_to_4 = c("crit1_4"),
                        crit_to_3 = c("crit1_3"),
                        non_crit = "crit1_nc"),
               4)


})

