#!/usr/bin/perl -w
# usage: cat htmls/*.html | ./findratings.pl > ratings.csv

# Take many HTML files (about user ratings of x-files episodes)
# downloaded from IMDb, and pull numerical rating data out of the
# HTML. Needs fixing because 'cat' command doesn't let us know
# filename (episode code).

# Copyright (C) 2014 Andrew J. Zimolzak. Full copyright notice,
# exclusion, and license are in the LICENSE file.

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
