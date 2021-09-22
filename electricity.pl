#!/usr/bin/env perl

use strict;
use warnings;

my %content; #creating a hash

open(DATA, "<electricity.txt") or die "Couldn't open file solar.txt, $!";
	
while(<DATA>) { 
    chomp;   # remove line
	foreach my $info (split(/\W+/)) { # Loop to iterate the list of words
		$content{$info} += 1 unless ($info eq ''); # adding to the hash	
  }
} 
close DATA;

print "Alphabetically (ignoring capitalization)\n";

foreach my $info (sort {lc $a cmp lc $b} keys %content) { # sorting in alphabetical order 
    printf "%-8s %s\n", $info, $content{$info};                            
}

print "Alphabetically with upper case words just in front of lower case words with the same initial characters\n"; 
foreach my $info (sort { (lc(substr($a, 0, 1)) eq lc(substr($b, 0, 1))) ? ($a cmp $b) : (lc($a) cmp lc($b)); } keys %content) { # sort in alphabetical order if the first initial is the same 
	 printf "%-8s %s\n", $info, $content{$info}; 
	
}

print "By frequency, from high to low, (any order for equal frequency)\n";
foreach my $info (sort {$content{$b} <=> $content{$a} || $a cmp $b } keys %content) { # sorting the frequencey of the strings 
	printf "%-8s %s\n", $info, $content{$info}; 
}

print "By frequency, with alphabetical order for words with the same frequency\n";
foreach my $info (sort { ($content{$a} == $content{$b}) ? ($a cmp $b) : ($content{$b} <=> $content{$a}); } keys %content){# if the string has the same frequency it will be grouped together while alphabetical order
	printf $info." ".$content{$info}."\n";
}