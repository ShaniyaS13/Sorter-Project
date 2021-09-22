#!usr/bin/perl
use strict;
use warnings;

open(DATA, "<solar.txt") or die "Couldn't open file solar.txt, $!"; # Open the input file

print "\n";
print "Print all records that do not list a discoverer in the eighth field.\n\n";
while(<DATA>) { # loop of the file
	my @temp1 = split(/ /, $_); # creating an array for record 
	if($temp1[7] eq "?" || $temp1[7] eq '-'){ # statement to print without the eighth field
	 print "@temp1\n"; # print the array
	}
}

print "\n";
print "Print every record after erasing the second field\n\n";
open(DATA, "<solar.txt") or die "Couldn't open file solar.txt, $!";
while(<DATA>){
	my @temp2 = split(/ /, $_);
	$temp2[1] = ' '; # to erase the second field
	print "@temp2\n";
}

print "\n";
print "Print the records for satellites that have negative orbital periods.\n\n";
open(DATA, "<solar.txt") or die "Couldn't open file solar.txt, $!";
while(<DATA>) {
	my @temp3 = split(/ /, $_);
    if ( $temp3 [4] =~ /^-?\d+\.?\d*$/ && $temp3 [4] < 0) # statement to print negative records
	{
        print "@temp3\n";
    }
}

print "\n";
print "Print the data for the objects discovered by the Voyager2 space probe.\n\n";
open(DATA, "<solar.txt") or die "Couldn't open file solar.txt, $!";
while(<DATA>) {
	my @temp4 = split(/ /, $_);
	#print "@temp4\n";
	if($temp4[7] eq "Voyager2"){ # statement to print if records that include Voyager2
	 print "@temp4\n";
	}
}

print "\n";
print "Print each record with the orbital period given in seconds rather than days.\n\n";
open(DATA, "<solar.txt") or die "Couldn't open file solar.txt, $!";
while(<DATA>){
	my @temp5 = split(/ /, $_);
	if($temp5[4] ne "?" && $temp5[4] ne "-" && $temp5 [4] =~ /^-?\d+\.?\d*$/){ # statement for records that don't include "?" and "-" and has the values for seconds
		$temp5[4] *= 86400;   # Multiplying from days and converting to seconds
	}
	print "@temp5\n";
}
close (DATA);