# =====================================================================
# STAT 230 - Linear Models
# R practical 1: Regression splines
# =====================================================================
# Data: Boston (package MASS), 506 census tracts of Boston
#   medv  = median value of owner-occupied homes (in $1000s)
#   lstat = lower status of the population (percent)
# =====================================================================

library(splines)
data(Boston, package = "MASS")

# A grid of lstat values for plotting fitted curves
lstat.grid <- seq(min(Boston$lstat), max(Boston$lstat), length.out = 200)
nd <- data.frame(lstat = lstat.grid)


# #####################################################################
# PART A 
# #####################################################################

# ---------------------------------------------------------------------
# Q1. Plot medv against lstat. Fit a simple linear regression, add the
#     line to the plot and look at the residuals vs fitted plot.
#     Is the relationship linear?
# ---------------------------------------------------------------------

plot(medv ~ lstat, data = Boston, pch = 16, col = "grey50")
fit1 <- lm(medv ~ lstat, data = Boston)

# your code here


# ---------------------------------------------------------------------
# Q2. Fit a quadratic and a cubic polynomial (use poly()).
#     Add both curves to the plot.
#     Compare the linear, quadratic and cubic models with anova().
# ---------------------------------------------------------------------

# your code here


# ---------------------------------------------------------------------
# Q3. Fit a linear spline with one knot at lstat = 10:
#       medv = b0 + b1 * lstat + b2 * (lstat - 10)_+ + error
#     Hint: (x - 10)_+ is pmax(x - 10, 0)
#     (a) What is the slope for lstat < 10? And for lstat > 10?
#     (b) Is the change in slope significant?
#     (c) Plot the fitted broken line.
# ---------------------------------------------------------------------

# your code here


# #####################################################################
# PART B 
# #####################################################################

# ---------------------------------------------------------------------
# Q4. Fit a cubic B-spline with bs(lstat, df = 6) and a natural spline
#     with ns(lstat, df = 4).
#     (a) Where are the knots? Hint: attr(bs(Boston$lstat, df = 6), "knots")
#     (b) Plot both fitted curves with 95% confidence bands
#         (predict(..., interval = "confidence") and matlines()).
#     (c) Where do the two fits differ most?
# ---------------------------------------------------------------------

# your code here


# ---------------------------------------------------------------------
# Q5. Choose the degrees of freedom of a natural spline, df = 1, ..., 10,
#     using AIC, BIC and PRESS (leave-one-out cross-validation):
#       PRESS = sum( (residual_i / (1 - h_ii))^2 )
#     Do the three criteria agree?
# ---------------------------------------------------------------------

press <- function(fit) sum((residuals(fit) / (1 - hatvalues(fit)))^2)

# your code here


# ---------------------------------------------------------------------
# Q6. Use an F test to compare your chosen natural spline (or
#     ns(lstat, df = 4) if you skipped Q5) with the simple linear model.
#     Write the null and alternative hypotheses.
# ---------------------------------------------------------------------

# your code here


# ---------------------------------------------------------------------
# Q7. With your chosen model, predict medv for lstat = 5, 15 and 30 with
#     95% confidence intervals and 95% prediction intervals.
#     What happens if you predict at lstat = 45? Why is this risky?
#     Compare with the prediction of the bs() model at lstat = 45.
# ---------------------------------------------------------------------

# your code here


# =====================================================================
# Q8 (bonus). Triceps skinfold thickness of 892 Gambian females
#   data(triceps, package = "MultiKink")   # install.packages("MultiKink")
#   triceps = triceps skinfold thickness, age = age in years
# ---------------------------------------------------------------------
#  (a) Fit a cubic polynomial in age.
#  (b) Fit a cubic regression spline with bs() and 3 knots of your choice.
#      Then move the knots: how does the fit change?
#  (c) Plot both fits on the same graph with different colours.
#  (d) Compare the models with adjusted R^2 and AIC. Which is better?
#  (e) Choose the df of a natural spline with AIC. Look at the residual
#      plot: is the variance constant? Try lntriceps as the response.
# =====================================================================

# your code here
