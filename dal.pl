#!/usr/bin/env perl

my $nameIn = $ARGV[0] or die("Invalid file input\n\n");   # use of ARGV to catch the name of file

open fIn, "< $nameIn" or die("Invalid file '$nameIn'\n\n");   # Open the input file
(my $nameOut = $nameIn) =~ s/(\.\w+?)$/_out$1/;    # Assigning output name to input name so they can be defined by the file
open fOut, "+> $nameOut" or die("Failed output file creation: '$nameOut'\n\n");   # Open the output file

my @values = ('zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine');   # array of strings used to change values in txt

print("Original file $nameIn: \n\n");                                                    
while (<fIn>) {   # loop for the input file
  print $_;  # Using a defult variable to print lines
  $_ =~ s/(\d)/$values[$1]/g;   # Finding the values and converting them to strings
  print fOut $_;   # print what was stored in the defult variable
} 
close fIn;   # Close the input file

seek(fOut, 0, 0);    # For the beginning of the output file to print it

print("Changed file (numbers to letters) $nameIn: \n\n");                                                   
while (<fOut>) { 
  print $_;
}
close fOut;  # Close the output file

