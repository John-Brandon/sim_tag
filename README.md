# Simulate Tag Study Data and Mark-Recapture Estimates
Explore statistical estimates from CJS model using RMark package, given simulated tag-recapture data. The CJS model estimates two parameters: `phi` (apparent survival) and `p` (detection probability). In the case of this study species, it is assumed `p` represents the probability of breeding when alive. The survival rate `phi` can be assumed to approximate true survival well in this case, because permanent emigration from a breeding colony would be rare.
Two study design variables are considered as they pertain to the model estimated parameters: `n` the number of individuals that are tagged; and the study duration, or length of recapture history (in years).
At this stage, `phi` and `p` are assumed equal for all tagged individuals in the population. Possible future extensions include, simulating differences in survival rates between sexes, nesting locations, etc. Such simulations would require some minor modifications to the code, but could be informative for statistical power analyses in terms of anticipating tagging efforts and re-sight study durations necessary for robust test results.
 
# Additional Assumptions
- To the extent that there is no perminant emigration, the survival estimate pertains to true survival. Instances of perminant emigration lead to an estimate of "apparent survival". The more instances of perminant emigration, the more negatively biased the estimate of apprarent survival will be relative to true survival. In other words, perminant emigration results in underestimates of true survival.
- Survival rates are constant through time, i.e., senescence is not modeled (in principal it could be though).
- The likelihood of skipping a breeding season is independent between years, i.e., if one year is skipped, the subsequent year is no more, nor less, likely than average to be skipped.




