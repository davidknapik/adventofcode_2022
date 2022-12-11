#!/usr/bin/perl

use strict vars;


my $DEBUG = 1;
my $TEST = 0;

my $input_file = 'input.txt' ;

my $loc = 0;
my ($c1, $c2, $c3, $c4) = '';


if ($TEST) {
	$input_file = 'test_input.txt' ;
}

# read in input file
open(FH, '<', $input_file) 
  or die $!;

while(<FH>) {
	chomp(my $line = $_) ;
	# printf("Line: %s\n",$line) ;

	for($loc = 0;$loc<=length($line);$loc++){

		printf("%4d : ",$loc+1);

		if(&store(substr($line,$loc,1))){
			printf("Found Sequence: %s%s%s%s at location %s\n",$c1,$c2,$c3,$c4,$loc+1);
		}

	}
	printf("\n");
	($c1, $c2, $c3, $c4) = ''
}


exit;

sub store($){
	my $char = shift ; 
	my $unique = 0 ;
	printf("char: %s\n", $char);

	$c1 = $c2 ;
	$c2 = $c3 ;
	$c3 = $c4 ; 
	$c4 = $char ;

	if(($c1 eq '') || ($c1 eq $c2 ) || ($c1 eq $c3) || ($c1 eq $c4) || ($c2 eq $c3) || ($c2 eq $c4) || ($c3 eq $c4)){
		return 0
	}

	return 1
}