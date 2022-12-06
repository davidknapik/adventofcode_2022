#!/usr/bin/perl


$input_file = 'test_input.txt' ;


# read in input file
open(FH, '<', $input_file) 
  or die $!;

# Loop through inputs
while(<FH>) {
	chomp($line = $_) ;
	printf("Line: %s\n", $line);

}