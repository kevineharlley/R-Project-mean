require(animation) 
require(ggplot2)
require(grid)
require(shape)

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

lLeft = matrix(c(lbound-5, 0.8), nrow=1, ncol=2)
uLeft = matrix(c(lbound-5, 1), nrow=1, ncol=2)
lRight = matrix(c(rbound+5, 0.8), nrow=1, ncol=2)
uRight = matrix(c(rbound+5, 1), nrow=1, ncol=2)

cORotation = c(xmean, 0.8)

rlLeft = rotatexy(lLeft, angle = 60, mid=cORotation)
ruLeft = rotatexy(uLeft, angle = 60, mid=cORotation)
rlRight = rotatexy(lRight, angle = 60, mid=cORotation)
ruRight = rotatexy(uRight, angle = 60, mid=cORotation)
polygon(rlLeft, ruLeft, rlRight, ruRight)

for (i in 1:90){
	rlLeft = rotatexy(lLeft, angle = i, mid=cORotation)
	ruLeft = rotatexy(uLeft, angle = i, mid=cORotation)
	rlRight = rotatexy(lRight, angle = i, mid=cORotation)
	ruRight = rotatexy(uRight, angle = i, mid=cORotation)
	polygon(rlLeft, ruLeft, rlRight, ruRight)

}



