require(animation) 
require(ggplot2)
require(grid)
require(shape)

xvalues <- c(38, 58, 80, 30, 50, 49, 45, 42, 59, 47, 34, 53, 35, 42, 42, 51, 51, 40, 48, 34, 46, 45, 50, 61, 62, 51, 59, 65, 49, 37)

xLength <- length(xvalues)

xmean <- mean(xvalues)
lbound <- min(xvalues)
rbound <- max(xvalues) 

readkeygraph <- function(prompt)
{
    getGraphicsEvent(prompt = prompt, 
                 onMouseDown = NULL, onMouseMove = NULL,
                 onMouseUp = NULL, onKeybd = onKeybd,
                 consolePrompt = "[click on graph then follow top prompt to continue]")
    Sys.sleep(0.01)
    return(keyPressed)
}

onKeybd <- function(key)
{
    keyPressed <<- key
}

xmean
lbound
rbound

yvalues <- rep(1, xLength)

num = length(xvalues)

## set some options first
oopt = ani.options(interval = 0.2, nmax = 100)

## use a loop to create images one by one

for (i in 100:1){
	plot(xvalues, yvalues+i, xlim=c(0,100), ylim=c(0,100))
	ani.pause()
}

## restore the options
ani.options(oopt)

rect(lbound-5, 1, rbound+5, 0.8)
polygon(c(xmean, xmean-5, xmean +5), c(1, -3.5, -3.5))

keyPressed = readkeygraph("[press any key to continue]")

dev.off()

plot(0, 0, xlim=c(0,100), ylim=c(0,100))

xmean = xmean + 5

polygon(c(lbound-5, lbound-5, rbound+5, rbound+5), c(-5, -5.2, 5, 5.2))
polygon(c(xmean, xmean-5, xmean +5), c(0, -3.5, -3.5))

keyPressed = readkeygraph("[press any key to continue]")

dev.off()

plot(0, 0, xlim=c(0,100), ylim=c(0,100))

xmean = xmean - 13

polygon(c(lbound-5, lbound-5, rbound+5, rbound+5), c(5, 5.2, -5, -5.2))
polygon(c(xmean, xmean-5, xmean +5), c(3, -3.5, -3.5))