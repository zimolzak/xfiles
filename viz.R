# Copyright (C) 2014 Andrew J. Zimolzak. Full copyright notice,                                              
# exclusion, and license are in the LICENSE file.                                                            

require(ggplot2)

ratings = read.csv( "/Users/ajz/Desktop/xfiles/ratings.csv", header=FALSE)

max = apply(ratings,1,max)

# initialize x
x = data.frame(ep=1:dim(ratings)[1])
x$rating = rep(10, dim(ratings)[1])
x$num = ratings$V1 / max

#continue unrolling matrix of ratings into frame x.
rating_i = 9
for (i in 2:10) {
	temp = data.frame(ep=1:dim(ratings)[1])
	temp$rating = rep(rating_i, dim(ratings)[1])
	temp$num = ratings[,i] / max
	x = rbind(x,temp)
	rating_i = rating_i - 1
}

plot = ggplot(x, aes(xmin=ep-(num*0.4), xmax=ep+(num*0.4), ymin=rating, ymax=rating+1))

plot + geom_rect()  

