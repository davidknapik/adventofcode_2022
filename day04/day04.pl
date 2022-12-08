#!/usr/bin/perl

$DEBUG=1;
$TEST=0;

my $input_file = 'input.txt' ;

if ($TEST) {
	$input_file = 'test_input.txt' ;
}
my $totalContained = 0 ;
my $totalOverlap = 0 ;

# read in input file
open(FH, '<', $input_file) 
  or die $!;

# Loop through inputs
while(<FH>) {
	chomp($line = $_) ;
	printf("Line: %s\n",$line) ;
	
	if (isContained($line)){
		$totalContained++;
	}
	if (isOverlap($line)){
		$totalOverlap++;
	}

	printf("\n");

}

close(FH);

printf("\n");
printf("Total Contained: %s\n", $totalContained);
printf("Total Overlap: %s\n", $totalOverlap);


exit;

sub isOverlap($){
	my $assignment = shift ;
	my $isOverlap = 1 ; # 0=no overlap, 1=overlap

	# split out assignment by user & start/stop
	($a1, $a2, $b1, $b2) = split(/[-,]/, $assignment);
	
	#
	# check if the A set is fully 'before' the B set
	# check if the B set is fully 'before' the A set
	# if neither of these is true then the sets must overlap
	#

	# A before B
	# A:.234......
	# B:.....567..
	if(($a1 < $b1) && ($a2 < $b1)){
		$isOverlap = 0 ;
	}

	# B before A
	# A:.....567..
	# B:.234......
	if(($b1 < $a1) && ($b2 < $a1)){
		$isOverlap = 0 ;
	}

	printf("Overlap: %s\n", $isOverlap) if $DEBUG;

	return $isOverlap;
}

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

	printf("Contained: %s\n", $isContained) if $DEBUG;

	return $isContained;

}