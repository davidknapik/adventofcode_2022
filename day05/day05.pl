#!/usr/bin/perl

use strict vars;


my $DEBUG = 1;
my $TEST = 0;

my $input_file = 'input.txt' ;

my @array=();

if ($TEST) {
	$input_file = 'test_input.txt' ;
}

# read in input file
open(FH, '<', $input_file) 
  or die $!;

while(<FH>) {
	chomp(my $line = $_) ;
	# printf("Line: %s\n",$line) ;

	# check for init line and send to array
	if ($line =~ /\[/) {
		&init_array($line);
	}

	# check for 'move instruction'
	if ($line =~ /^move/) {
		#&move_crate($line);
		&move_crate2($line);

	}
	&print_array();

}

&print_array();

exit; 

sub print_array(){
	# print the array
	print "\n";
	for my $row (0..$#array) {
		printf("Col: %3d: ", $row+1);

		my @columns = @{$array[$row]} ;
		for my $column (@columns) {
			printf("%3s",$column) ;
		}
		print "\n";
	}
	print "\n";
}


sub move_crate($){
	my $line = shift;

	my ($move_qty, $from_col, $to_col) = (split(/\s/,$line))[1,3,5];

	printf("move_qty: %s, from_col: %s, to_col:%s\n", $move_qty, $from_col, $to_col);

	for (my $qty = 0; $qty < $move_qty; $qty++){
		my $pop = pop( @{$array[$from_col-1]});
		push(@{$array[$to_col-1]}, $pop);
		printf("Moving: %s from %s to %s\n", $pop, $from_col-1, $to_col-1);
	}

}

sub move_crate2($){
	my $line = shift;

	my @tmp = ();

	my ($move_qty, $from_col, $to_col) = (split(/\s/,$line))[1,3,5];

	printf("move_qty: %s, from_col: %s, to_col:%s\n", $move_qty, $from_col, $to_col);

	for (my $qty = 0; $qty < $move_qty; $qty++){
		my $pop = pop( @{$array[$from_col-1]});
		push(@tmp, $pop) ; 
	}

	for (my $qty = 0; $qty < $move_qty; $qty++){
		my $pop = pop(@tmp);
		push(@{$array[$to_col-1]}, $pop);		
		printf("Moving: %s from %s to %s\n", $pop, $from_col-1, $to_col-1);
	}


}

sub init_array($){

	my $line = shift;

	#printf("Init: %s\n", $line);

	for (my $pos = 1; $pos < length($line)-1; $pos = $pos + 4) {

		my $char = substr($line,$pos,1); 
		my $array_index = int($pos/4);

		#printf("%s: %s\n", $array_index, $char);

		if ($char =~ /\w/) {
			#printf("push %s to %s\n", $char, $array_index);
			unshift(@{$array[$array_index]}, $char) ; 
		}

	}

}