#!/usr/bin/perl

$DEBUG=0;

$input_file = 'input.txt' ;
$total = 0 ;

# read in input file
open(FH, '<', $input_file) 
  or die $!;

# Loop through inputs
while(<FH>) {
	chomp($line = $_) ;
	printf("Line: %s\n", $line) if $DEBUG;

	#
	# split line in half based on length
	# assign first half to compartment1 
	# assign second half to comparment2
	#
	$comp_size = length($line) / 2 ;
	$comp1 = substr($line, 0, $comp_size);
	$comp2 = substr($line, $comp_size);
	printf("Comp1: %s\nComp2: %s\n", $comp1, $comp2);


	$common = find_common($comp1, $comp2);
	printf("Common: %s\n", $common);

	# character values
	# a-z 1 through 26
	# A-Z 27 through 52

	# use ord() to get ascii value 
	# ord(a) = 97
	# ord(z) = 122
	# ord(A) = 65
	# ord(Z) = 90
	
	# modify ascii value to match given problem value
	$value = ord($common);
	if ($value > 97) {
		$value -= 96;
	} else {
		$value -= 38 ;
	}

	printf("Value: %s\n", $value);
	printf("\n");

	$total+=$value;


}

printf("Total: %s\n", $total);



sub find_common($$) {
	($c1, $c2) = @_;
	$found = '';

	@characters = split(//,$c1);

	printf("C1: %s\nC2: %s\n", $c1, $c2) if $DEBUG;

	foreach $char (@characters) {
		printf("Checking for char: %s\n",$char) if $DEBUG;
		if ( $c2 =~ $char ) {
			return $char;
		}

	}

	return $found
}