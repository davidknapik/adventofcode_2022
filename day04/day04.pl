#!/usr/bin/perl

$DEBUG=1;
$TEST=0;

my $input_file = 'input.txt' ;

if ($TEST) {
	$input_file = 'test_input.txt' ;
}
my $total = 0 ;

# read in input file
open(FH, '<', $input_file) 
  or die $!;

# Loop through inputs
while(<FH>) {
	chomp($line = $_) ;
	printf("Line: %s\n",$line) ;
	
	if (isContained($line)){
		$total++;
	}


}

close(FH);

printf("\n");
printf("Total: %s\n", $total);


exit;


sub isContained($){
	my $assignment = shift ;
	my $isContained = 0 ; # 0=no overlap, 1=overlap

	# split out assignment by user & start/stop
	($a1, $a2, $b1, $b2) = split(/[-,]/, $assignment);

	printf("A1: %s, A2: %s, B1: %s, B2: %s\n", $a1, $a2, $b1, $b2) if $DEBUG;

	# A containted in B
	($isContained=1) if( ($a1>=$b1) && ($a2<=$b2));
	# B containted in A
	($isContained=1) if( ($b1>=$a1) && ($b2<=$a2));

	printf("Contained: %s\n\n", $isContained) if $DEBUG;

	return $isContained;

}