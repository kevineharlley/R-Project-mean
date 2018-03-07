require(animation) 
require(ggplot2)
require(grid)
require(shape)

lbound = 5
rbound = 100

lLeft = matrix(c(lbound-5, 0.8), nrow=1, ncol=2)
uLeft = matrix(c(lbound-5, 1), nrow=1, ncol=2)
lRight = matrix(c(rbound+5, 0.8), nrow=1, ncol=2)
uRight = matrix(c(rbound+5, 1), nrow=1, ncol=2)

lLeft

plot(1, 0)

xmean = 70

polygon(lLeft, uLeft, lRight, uRight)

for (i in 1:90){
	rAngle = (i/180)*3.142
	rlLeft = rotatexy(lLeft, angle = rAngle, mid=c(xmean, 0.8))
	ruLeft = rotatexy(uLeft, angle = rAngle, mid=c(xmean, 0.8))
	rlRight = rotatexy(lRight, angle = rAngle, mid=c(xmean, 0.8))
	ruRight = rotatexy(uRight, angle = rAngle, mid=c(xmean, 0.8))
	polygon(rlLeft, ruLeft, rlRight, ruRight)
}
	