require(animation) 
require(ggplot2)
require(grid) 

path<-data.frame(time=1:100,x=1:5,y=1:100)
ggplot(path)+geom_point(aes(x,y))

ggplot(path)+geom_point(aes(x=x, y=y), size=4, shape=21, fill="white")

saveGIF({
  lapply(1:nrow(path), fun)
},movie.name="visualmean.gif",interval=0.2)