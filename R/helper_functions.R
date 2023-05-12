#!usr/bin/env Rscript
#
# Purpose: Helper Functions 
#
# Notes: More details provided in comments of individual functions.
#  
# Author: John R. Brandon, PhD 
#         https://github.com/John-Brandon/sim_tag
# Date: 2023-05-11
library(pacman)
p_load(here, tidyverse, readxl)
set.seed(seed = 42)

# Helper functions -------------------------------------------------------------
format_result_ls = function(XX) {
  # A short wrapper function that is used in calls to `lapply` to format simulated recapture histories as MARK input
  # TODO: This function can be merged as one with `format_X_data()`
  data.frame(ch = format_X_data(recap_history = XX))
}

get_estimates = function(mark_model){  # , phi, p, n_tags, n_yrs
  # MARK output is contained in a list. Extract parameter estimates.
  beta_hat = mark_model$results$real  # Point estimates and CIs. Extract parameter names from `rownames` of this data.frame
  par_names = stringr::str_split_i(rownames(beta_hat), " ", i = 1)  # extract parameter names (e.g. "Phi" or "p")
  beta_hat %>%
    mutate(parameter = par_names) %>%
    dplyr::select(-fixed, -note) %>%
    dplyr::mutate(cv = se / estimate) %>% 
    dplyr::select(parameter, estimate, cv, everything()) %>% 
    tibble::remove_rownames() %>% 
    mutate(phi = phi,
           p = p,
           n_tags = n_tags,
           n_yrs = n_yrs)
}

format_X_data = function(recap_history){
  # `recap_history` is a binary integer (1's and 0's) matrix of the recapture history
  # Collapse recapture history into a string (e.g. "111011000"). Which is necessary format for program MARK
  apply(X = recap_history, MARGIN = 1, FUN = paste, collapse = "")
}

sys_open = function(f_name) system(paste("open", here(f_name)))
