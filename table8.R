library(reshape2)
library(ggplot2)
library(readxl)

# read data - download first as read_excel() can't do URLs
xlfile = tempfile(fileext = '.xlsx')
download.file("https://www.nrscotland.gov.uk/files//statistics/drug-related-deaths/17/drug-related-deaths-17-tabs-figs.xlsx", xlfile, mode="wb")

# read data
table8.dat = read_excel(xlfile, sheet = 10, col_names=FALSE)

# extract core data and convert to numbers
dat = table8.dat[10:27,2:6]
dat = data.frame(apply(dat, 2, as.numeric))

# extract mean for last five years
yr5mean = as.numeric(table8.dat[29,7])

# add labels
names(dat) <- c("15-24","25-34","35-44","45-54","55-64")
dat = cbind(Year=factor(seq(2000,2017)), dat)

# melt data and plot
# note: dashed line is for average deaths 2012-2016 for ages 15-64
dat.m = melt(dat, variable.name = "Age")
ggplot(dat.m, aes(x=Year, y=value, group=Age, colour=Age)) + 
  geom_hline(yintercept = yr5mean, colour="#990000", linetype="dashed") + 
  geom_line(size=1.2) + 
  ylab("Deaths per 1000 population") + 
  annotate("text", label="Mean 2013-2017", x=16.8,y=yr5mean-0.015,size=3,colour="#990000") +
  scale_x_discrete(breaks=seq(2000,2016,2)) + 
  ggtitle("Scotland Drug-Related Deaths")
