require(animation) 
require(ggplot2)
require(grid)

xvalues <- c(4, 40, 60, 80)
xmean <- mean(xvalues)
lbound <- min(xvalues)
rbound <- max(xvalues) 

xmean
lbound
rbound

yvalues <- c(1, 1, 1, 1)
num = length(xvalues)

## set some options first
oopt = ani.options(interval = 0.2, nmax = 100)

## use a loop to create images one by one

for (i in 20:1){
	plot(xvalues, yvalues+i, xlim=c(0,100), ylim=c(0,100))
	ani.pause()
}

## restore the options
ani.options(oopt)

rect(lbound-5, 1, rbound+5, 0.8)

polygon(c(xmean, xmean-5, xmean +5), c(1, -3.5, -3.5))
