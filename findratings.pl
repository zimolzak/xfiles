#!/usr/bin/perl -w
# usage: cat htmls/*.html | ./findratings.pl > ratings.csv
# Needs fixing because 'cat' command doesn't let us know filename
# (episode code).
use strict;

while(<>){
    if (/Arithmetic/){
	chomp;
	s/.*(<table)/$1/;
	s/<\/table>.*//;
	my @tablerow = split(/<tr>/);
	shift @tablerow;
	shift @tablerow; #throw out first two. Should check them.
	foreach (@tablerow) {
	    s/^<td align="right">([0-9]+).*/$1/;
	}
	print join(",", @tablerow);
	print "\n";
    }
}
