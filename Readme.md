Detailed X-Files Ratings
========================

I want to get the individual data points for each IMDb user's rating
of each episode of the television show "The X-Files." Then I want to
plot each histogram, in a nice way, over time.

How to use these files:

1. Download the list of episode links from
  http://www.imdb.com/title/tt0106179/eprate?ref_=ttep_ql_3
2. Rename this to ep_ratings.html
3. Run findlinks.pl on it, to generate get_htmls.sh
4. Run get_htmls.sh (takes maybe a minute).
5. Move all of those into folder called htmls/ for convenience.
6. Concatenate the those HTML files and pipe to findratings.pl, to
  create ratings.csv

Issues
------

Need to fix it so the season & episode number get printed out along
with the histogram of ratings. This is because the filenames are
numbered 1 2 3 .. 10 11, and not 01 02 03. That causes bash and other
shells to put them out of order when you do things like 'cat *.html'.
