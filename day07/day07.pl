#!/usr/bin/perl

use strict vars;


my $DEBUG = 1;
my $TEST = 1;

my $input_file = 'input.txt' ;
my @path = ();
my $dir_size = 0;
my %h = () ;

if ($TEST) {
	$input_file = 'test_input.txt' ;
}

# read in input file
open(FH, '<', $input_file) 
  or die $!;

while(<FH>) {
	chomp(my $line = $_) ;
	# printf("Line: %s\n",$line) ;

	# check if the line was a input/command or output
	if ($line =~ /[\$]/){
		printf("Command: %s\n", $line);

		if ($line =~ /^\$ cd \/$/){
			# reset path 
			#printf("Reset path\n");
			@path = () ;
			#push(@path,"/");
		}

		if ($line =~ /^\$ cd \w+/) {
			# decending into directory
			my $dir = (split(/ /, $line))[2];
			#printf("directory decend: %s\n", $dir);
			push(@path,$dir);
		}

		if ($line =~ /^\$ cd \.\.$/) {
			# assending directory
			#printf("directory assend (..)\n");
			pop(@path);
		}

		if ($line =~ 'ls'){
			# directory listing (nothing to do with this command)
			printf("directory listing (ls)\n");
			$dir_size = 0 ;

		}
		#printf("%s /%s\n", $dir_size, join('/', @path));

	}

	if($line =~ '^dir'){
		# nothing really to do here
		printf("found a directory %s\n", $line);
	}

	if($line =~ /\d+ \w+/){
		# found a file with size
		my ($file_size, $file_name) = split(/ /,$line);

		#printf("file: %s size: %d\n",$file_name, $file_size);

		#add file size to hash entry
		$h{"/root/" . join('/', @path)}{'files'}+=$file_size;
	}
}

# dump hash
printf("\nDirectory Totals\n");

foreach my $key (sort (keys %h)) {
	printf("%12s %s\n", $h{$key}{'files'}, $key) ;
	$h{$key}{'total'} = $h{$key}{'files'};
}

printf("\n\n");

foreach my $okey (sort (keys %h)) {
	foreach my $ikey (sort (keys %h)){
		# printf("Testing okey: %s ikey: %s\n",$okey, $ikey);

		if ($ikey =~ $okey){
			if ( $okey eq $ikey){
				# printf("okey: %s equals ikey: %s total: %s\n\n",$okey, $ikey,$h{$okey}{'total'});
			} else {
				$h{$okey}{'total'} = $h{$okey}{'total'} + $h{$ikey}{'files'}; 
				# printf("okey: %s is in ikey: %s ikey_files: %s total: %s\n\n",$okey, $ikey, $h{$ikey}{'files'}, $h{$okey}{'total'});
			}
		}
	}
	# printf("\n");
}

printf("\nRoll-up Totals\n");
foreach my $key (sort (keys %h)) {
	printf("%12s %s\n", $h{$key}{'total'}, $key) ;
}


