# Copyright (C) 2014 Andrew J. Zimolzak. Full copyright notice,                                              
# exclusion, and license are in the LICENSE file.                                                            
require(ggplot2)
ratings = read.csv( "/Users/ajz/Desktop/xfiles/ratings.csv", header=TRUE)

max = apply(ratings[,3:12],1,max)

# initialize x
x = data.frame(season=ratings$s, episode=ratings$e)
x$rating = rep(10, dim(ratings)[1])
x$num = ratings$X10

#continue unrolling matrix of ratings into frame x.
rating_i = 9
for (i in 4:12) { 				# col 4 thru col 12 is ratings 9 down to 1.
	temp = data.frame(season=ratings$s, episode=ratings$e)
	temp$rating = rep(rating_i, dim(ratings)[1])
	temp$num = ratings[,i]
	x = rbind(x,temp)
	rating_i = rating_i - 1
}

x$normalized = x$num / rep(max, 10) # assumes ratings go from 1 to 10
# all_ratings = data.frame(season=rep(x$season, x$num), episode=rep(x$episode, x$num), rating = rep(x$rating, x$num)) # unroll again for histogram purposes

# season1 = all_ratings[all_ratings$ep<=24,]
# s1x = x[x$ep<=24,]
# sorted = all_ratings[order(all_ratings$ep),]

# pseudo_bean_plot = ggplot(x, aes(xmin=ep-(normalized*0.4), xmax=ep+(normalized*0.4), ymin=rating, ymax=rating+1))
# pseudo_bean_plot + geom_rect()  

# violin = ggplot(all_ratings, aes(factor(ep), rating ))
# violin + geom_violin() # doing violin+geom_boxplot() has too much vibration

# histog_sqrt = ggplot(all_ratings, aes(x=rating)) 
# histog_sqrt + geom_histogram(binwidth=1) + facet_wrap(~ep) + scale_y_sqrt() + opts(strip.background = theme_blank(), strip.text.x = theme_blank())

# I like this last one the best
scale_bar = ggplot(x, aes(x=factor(rating), y=normalized))
scale_bar + geom_bar(stat="identity", width=1) + facet_grid(season~episode) + theme(axis.text=element_blank(), axis.ticks=element_blank(), axis.title=element_blank())
