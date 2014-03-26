#!/usr/bin/perl -w
# usage: ./findlinks.pl ep_ratings.html > ep_links.txt
use strict;
while(<>){
    if (/href=\"\/title\/tt[0-9]+\/\"/){
	s/.*<td><a href=\"/http:\/\/www.imdb.com/;
	s/\">.*//;
	print;
    }
}
