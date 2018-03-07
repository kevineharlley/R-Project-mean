require(animation) 
require(ggplot2)
require(grid) 
path<-data.frame(time=1:100,x=1,y=1:100)
ggplot(path)+geom_point(aes(x,y))
path$prevx<-c(rep(0,steps),path$x[1:(nrow(path)-steps)])
path$prevy<-c(rep(0,steps),path$y[1:(nrow(path)-steps)])
path$prevtime<-c(rep(0,steps),path$time[1:(nrow(path)-steps)])
steps<-2
path$v<-((((path$x-path$prevx)^2)+((path$y-path$prevy)^2))^0.5)/(path$time-path$prevtime)
path$atan2<-atan2((path$x-path$prevx),(path$y-path$prevy))
ggplot(path)+geom_segment(aes(x = x-(v*sin(atan2)), y = y-(v*cos(atan2)), xend = x, yend = y),
                          arrow=arrow(length = unit(0.5, "cm")) ,
                          alpha=0.5, size=2,
                          color="blue")+
geom_point(aes(x = x-(v*sin(atan2)), y = y-(v*cos(atan2))),
                          size=5, shape = 21, fill = "white")
plot_arrow<-function(vec){
  alphas<-rev(1/(1:length(vec))^1.5) # this create an alpha scale
  g<-ggplot(path[vec,])+geom_segment(aes(x = x-(v*sin(atan2)), y = y-(v*cos(atan2)), xend = x, yend = y),
                               arrow=arrow(length = unit(0.5, "cm")) , # create arrow
                               alpha=alphas, size=2,
                               color="blue")+
    coord_cartesian(xlim=c(min(path$x),max(path$x)),ylim=c(min(path$y),max(path$y))) # fix width
  print(g)
}
saveGIF({
  lapply(1:nrow(path),function(x)plot_arrow(max(1,x-5):x))
},movie.name="comet.gif",interval=0.2)