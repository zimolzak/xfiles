# Copyright (C) 2014 Andrew J. Zimolzak. Full copyright notice,                                              
# exclusion, and license are in the LICENSE file.                                                            
require(ggplot2)
ratings = read.csv( "/Users/ajz/Desktop/xfiles/ratings.csv", header=TRUE)

max = apply(ratings[,3:12],1,max)

# initialize x
x = data.frame(season=ratings$s, episode=ratings$e, title=ratings$title)
x$rating = rep(10, dim(ratings)[1])
x$num = ratings$X10

#continue unrolling matrix of ratings into frame x.
rating_i = 9
for (i in 4:12) { 				# col 4 thru col 12 is ratings 9 down to 1.
	temp = data.frame(season=ratings$s, episode=ratings$e, title=ratings$title)
	temp$rating = rep(rating_i, dim(ratings)[1])
	temp$num = ratings[,i]
	x = rbind(x,temp)
	rating_i = rating_i - 1
}

x$normalized = x$num / rep(max, 10) # assumes ratings go from 1 to 10

scale_bar = ggplot(x, aes(x=factor(rating), y=normalized))
# scale_bar = ggplot(x, aes(x=factor(rating), y=normalized, fill=factor(season))) # diff color bar for ea season

scale_bar + geom_bar(stat="identity", width=1) + facet_grid(season~episode) + theme(axis.text=element_blank(), axis.ticks=element_blank(), axis.title=element_blank()) # can't figure out how to include names

scale_bar + geom_bar(stat="identity", width=1) + facet_wrap(~ title, ncol=23) + theme(axis.text=element_blank(), axis.ticks=element_blank(), axis.title=element_blank(), strip.text=element_text(size=5))
