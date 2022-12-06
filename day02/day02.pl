#!/usr/bin/perl

#########################################
#    Opponent    #    Player      # Pts #
#########################################
#  A = Rock      #  X = Rock      #  1  #
#  B = Paper     #  Y = Paper     #  2  #
#  C = Scissors  #  Z = Scissors  #  3  #
#########################################

##################
# Outcome Points #
##################
#   Lose   #  0  #
#   Draw   #  3  #
#   Win    #  6  #
##################

$input_file = 'input.txt' ;
$total_score = 0 ;

# read in input file
open(FH, '<', $input_file) 
  or die $!;

# Loop through inputs
while(<FH>) {
	chomp($line = $_) ;
	printf("Line: %s\n", $line);

#################
#  Score Table  #
#################
# A X # 1+3 # 4 #
# A Y # 2+6 # 8 #
# A Z # 3+0 # 3 #
#################
# B X # 1+0 # 1 #
# B Y # 2+3 # 5 #
# B Z # 3+6 # 9 #
#################
# C X # 1+6 # 7 #
# C Y # 2+0 # 2 #
# C Z # 3+3 # 6 #
#################

	($line eq "A X") ? ($total_score += 4) : ($total_score) ;
	($line eq "A Y") ? ($total_score += 8) : ($total_score) ;
	($line eq "A Z") ? ($total_score += 3) : ($total_score) ;

	($line eq "B X") ? ($total_score += 1) : ($total_score) ;
	($line eq "B Y") ? ($total_score += 5) : ($total_score) ;
	($line eq "B Z") ? ($total_score += 9) : ($total_score) ;

	($line eq "C X") ? ($total_score += 7) : ($total_score) ;
	($line eq "C Y") ? ($total_score += 2) : ($total_score) ;
	($line eq "C Z") ? ($total_score += 6) : ($total_score) ;

}

# output total score
printf("Total: %s\n", $total_score) ;
