#!/usr/bin/perl


$input_file = 'input.txt' ;
$max_elf_num = 0 ;
$max_elf_cal = 0 ;
$elf_num = 1 ;
$elf_cal = 0 ;

# read in input file
open(FH, '<', $input_file) 
  or die $!;

# loop through all entries
while(<FH>){
    $input_line = $_ ; 
    # print $input_line ;

    if ($input_line =~ /^\s*$/ ) {
        printf("Elf: %3s %6s\n", $elf_num, $elf_cal);
        if($elf_cal > $max_elf_cal) {
            $max_elf_num = $elf_num ;
            $max_elf_cal = $elf_cal;
        }
        $elf_num++ ;
        $elf_cal = 0 ;
    }

    $elf_cal += $input_line;


}

if($elf_cal > $max_elf_cal) {
    $max_elf_num = $elf_num ;
    $max_elf_cal = $elf_cal;
}

printf("Elf: %3s %6s\n\n", $elf_num, $elf_cal);
printf("Max Elf: %s %s\n", $max_elf_num, $max_elf_cal);

close(FH);

#
# For part two, since I didn't read the question before doing the code
# I ran the output through sort and added up the largest cal count
#