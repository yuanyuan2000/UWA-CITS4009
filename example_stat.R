# File name: example_stat.R
# Author: Du Huynh
# Date: July 2022
# Department of Computer Science and Software Engineering
# The University of Western Australia
#
# How to run the code below in RStudio:
#
# 1. Open RStudio
# 2. Set the working directory to where you store this R file.
# 3. Select: File > Open File > example_stat.R
#    Contents of the file should now be displayed in the Editor window
#    above the Console window. 
# 4. Press control-enter (the Ctrl key and the Enter key together) to
#    run the code line by line.
#
# pnorm(), and qnorm() functions. You can modify the code to
# view the plots for other distribution functions, e.g., 
#
#  - dexp(), pexp(), and qexp() for the exponential distribution
#    (you will need to modify vector x so that it has positive values only);
#
#  - dunif(), punif(), and qunif() for the uniform distribution
#    (you will need to modify vector x so that it is over the interval [0,1]).

library(ggplot2)
library(gridExtra)

x <- seq(-3, 3, length=500)

# dnorm(x) gives you the density of the normal distribution evaluated at x
y1 <- dnorm(x)

# pnorm(x) gives you the cumulative density function of the normal
# distribution evaluated at x
y2 <- pnorm(x)

# qnorm is the inverse of pnorm. So if pnorm(x) = y, then qnorm(y) = x.
q <- qnorm(y2)

# The argument passed to qnorm() must be in the range 0...1. 
# It is taken as an area value under the density function 
# of the Normal distribution over the interval (-infinity, xcoord].
# qnorm() returns the unknown location xcoord. In the line above,
# the output q vector should have elements identical to those in
# vector x. That is, qnorm() is the inverse of pnorm().

fig1 <- ggplot() + geom_line(aes(x=x, y=y1)) + labs(y="dnorm(x)")
fig2 <- ggplot() + geom_line(aes(x=x, y=y2)) + labs(y="pnorm(x)")
fig3 <- ggplot() + geom_line(aes(x=y2, y=q)) + labs(x="y", y="qnorm(y)")

# arrange the three figure one below each other on a column.
grid.arrange(fig1, fig2, fig3, ncol=1)

# Exercises:
# (a) change the colour of the three curves
# (b) copy the code to another R file and modify it for another distribution,
#     such as the exponential distribution, or the uniform distribution, etc.
