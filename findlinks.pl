#!/usr/bin/perl -w
# usage: ./findlinks.pl ep_ratings.html > get_htmls.sh

# Pull links to x-files episode pages out of an IMDb HTML file. Note
# that ep_ratings.html is:
# http://www.imdb.com/title/tt0106179/eprate?ref_=ttep_ql_3 . It is a
# list of mean ratings of all x-files episodes *with links* to
# indivitual histograms.

# Copyright (C) 2014 Andrew J. Zimolzak. Full copyright notice,
# exclusion, and license are in the LICENSE file.

use strict;
my $epcode;
print "#!/bin/sh\n";

while(<>){
    if (/&#160/){
	chomp;
	$epcode = $_;
	$epcode =~ s/.*\">//;
	$epcode =~ s/&#160.*//;
	$epcode =~ s/\./_/;
    }
    if (/href=\"\/title\/tt[0-9]+\/\"/){
	chomp;
	s/.*<td><a href=\"/http:\/\/www.imdb.com/;
	s/\">.*//;
	print "curl '" . $_ . "ratings?ref_=tt_ov_rt' -o " . $epcode . ".html\n";
    }
}

# example output line
# curl 'http://www.imdb.com/title/tt0751081/ratings?ref_=tt_ov_rt' -o 5_12.html
