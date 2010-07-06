#!/usr/bin/perl
use strict;
use warnings;
my $n = ((`pacman -Qu` =~ m/^[^\s]+\s\((\d+)\):/m) ? $1 : 0);
if ($n == 0)
{
     print "0"
}
elsif($n == 1)
{
     print "1"
}
else
{
     print "$n"
