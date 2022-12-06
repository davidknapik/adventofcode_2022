#!/usr/bin/perl

$DEBUG=0;

my $input_file = 'input.txt' ;
my $total = 0 ;
my $line_count = 0 ;
my $value = 0 ; 

# read in input file
open(FH, '<', $input_file) 
  or die $!;

# Loop through inputs
while(<FH>) {
	chomp($line = $_) ;
	printf("Line: %s\n", $line) if $DEBUG;
	$line_count++;

	$line_count == 1 ? ($comp1 = $line) : $line_count;
	$line_count == 2 ? ($comp2 = $line) : $line_count;
	$line_count == 3 ? ($comp3 = $line) : $line_count;


	if ($line_count >= 3) {
		#do stuff
		printf("Comp1: %s\nComp2: %s\nComp3: %s\n", $comp1, $comp2, $comp3);

		# find common character
		$common = &find_common($comp1, $comp2, $comp3);
		printf("Common: %s\n", $common);

		# convert character to value
		$value = &charValue($common);
		printf("Value: %s\n", $value);

		# add value to total
		$total+=$value;

		printf("\n");

		#reset line counter to grab the next three lines
		$line_count = 0 ;
	}
}

printf("Total: %s\n", $total);

exit 0;

sub charValue($) {
	my $char = shift;
	my $value = 0;
	
	printf("Char: %s\n",$char) if $DEBUG;

	# character values
	# a-z 1 through 26
	# A-Z 27 through 52

	# use ord() to get ascii value 
	# ord(a) = 97
	# ord(z) = 122
	# ord(A) = 65
	# ord(Z) = 90
	
	# modify ascii value to match given problem value
	$value = ord($char);
	if ($value > 97) {
		$value -= 96;
	} else {
		$value -= 38 ;
	}

	return $value
}

sub find_common($$$) {
	my ($c1, $c2, $c3) = @_;
	my $found = '';

	my @characters = split(//,$c1);

	printf("C1: %s\nC2: %s\nC3: %s\n", $c1, $c2, $c3) if $DEBUG;

	foreach my $char (@characters) {
		printf("Checking for char: %s\n",$char) if $DEBUG;
		if (( $c2 =~ $char ) && ($c3 =~ $char)) {
			return $char;
		}
	}

	return $found
}
