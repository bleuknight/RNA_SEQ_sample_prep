### log transform the FPKM
d2<- read.csv("FPKMover1.csv")
d<- d2
d$MonolayerA_ln1<- (d$MonolayerA_ln1 +0.01)
d$MonolayerA_ln2<- (d$MonolayerA_ln2 +0.01)
d$MonolayerB_ln1<- (d$MonolayerB_ln1 +0.01)
d$MonolayerB_ln2<- (d$MonolayerB_ln2 +0.01)
d$MatrixA_ln1<- (d$MatrixA_ln1 +0.01)
d$MatrixA_ln2<- (d$MatrixA_ln2 +0.01)
d$MatrixB_ln1<- (d$MatrixB_ln1 +0.01)
d$MatrixB_ln2<- (d$MatrixB_ln2 +0.01)

d.new <- d
d.new[, 2:9] <- log(d[2:9], 10)
d.new
str(d.new)
colnames(d.new)
require (reshape)
require (ggplot2)
long = melt(d.new, id.vars= "tracking_id")
long2 = melt(d2, id.vars= "tracking_id")
longNT = melt(d, id.vars= "tracking_id")
xvar <- c(rnorm(1500, mean = -1), rnorm(1500, mean = 1.5))
yvar <- c(rnorm(1500, mean = 1), rnorm(1500, mean = 1.5))
zvar <- as.factor(c(rep(1, 1500), rep(2, 1500)))
xy <- data.frame(xvar, yvar, zvar)
b1<-ggplot(xy, aes(zvar, xvar)) + 
  geom_boxplot(aes(fill = zvar)) +
  theme(legend.position = "none")
colnames(long)
b2<-ggplot(long, aes(variable, value)) + 
  geom_boxplot(aes(pattern = variable)) +
  theme(legend.position = "none") + ylim(-5, 5)
b2
p <- ggplot(long, aes(variable, value))

p + geom_boxplot() + theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1))