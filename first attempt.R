require(animation)
require(ggplot2)
require(grid)
ani.options(interval = 0.5)
values = c(2, 4, 5, 2, 6)
values <- c(2, 2, 4, 6, 8, 4)
saveGIF({
layout(matrix(c(1, rep(2, 5)), 6, 1))
for (i in 1:5){
plot(values, i)
par(fg = 1)
plot(-5, -2, xlim = c(1, 20), ylim = c(0, 2), axes = F, xlab = "",  ylab = "", main = "mean)
abline(v=i, lwd=5, col = rgb(0, 0, 255, 255, maxColorValue=255))
abline(v=i-1, lwd=5, col = rgb(0, 0, 255, 50, maxColorValue=255))
abline(v=i-2, lwd=5, col = rgb(0, 0, 255, 25, maxColorValue=255))
axis(1)
abline(v=values(chunk), col = rgb(255, 0, 0, 255, maxColorValue=255))
}
}