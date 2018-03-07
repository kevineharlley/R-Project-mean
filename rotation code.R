rlLeft = rotatexy(lLeft, angle = 45, mid=cORotation)
ruLeft = rotatexy(uLeft, angle = 45, mid=cORotation)
rlRight = rotatexy(lRight, angle = 45, mid=cORotation)
ruRight = rotatexy(uRight, angle = 45, mid=cORotation)
polygon(rlLeft, ruLeft, rlRight, ruRight)

for (i in 1:90){
	rlLeft = rotatexy(lLeft, angle = i, mid=cORotation)
	ruLeft = rotatexy(uLeft, angle = i, mid=cORotation)
	rlRight = rotatexy(lRight, angle = i, mid=cORotation)
	ruRight = rotatexy(uRight, angle = i, mid=cORotation)
	polygon(rlLeft, ruLeft, rlRight, ruRight)

}