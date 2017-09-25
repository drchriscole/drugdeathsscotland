library(reshape2)
library(ggplot2)

# read data
table8.dat = read.csv(file="https://www.nrscotland.gov.uk/files//statistics/drug-related-deaths/drd2016/16-drug-rel-deaths-tab8.csv", header=FALSE, stringsAsFactors = FALSE)

# extract core data and convert to numbers
dat = table8.dat[10:26,2:6]
dat = data.frame(apply(dat, 2, as.numeric))

# add labels
names(dat) <- c("15-24","25-34","35-44","45-54","55-64")
dat = cbind(Year=factor(seq(2000,2016)), dat)

# melt data and plot
# note: dashed line is for average deaths 2012-2016 for ages 15-64
dat.m = melt(dat, variable.name = "Age")
ggplot(dat.m, aes(x=Year, y=value, group=Age, colour=Age)) + 
  geom_hline(yintercept = 0.18, colour="#990000", linetype="dashed") + 
  geom_line(size=1.2) + 
  ylab("Deaths per 1000 population") + 
  annotate("text", label="Mean 2012-2016", x=16.3,y=0.175,size=3,colour="#990000") +
  scale_x_discrete(breaks=seq(2000,2016,2)) + 
  ggtitle("Scotland Drug-Related Deaths")
