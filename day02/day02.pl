#!/usr/bin/perl

#########################################
#    Opponent    #    Player      # Pts #
#########################################
#  A (Rock)      #  X (Rock)      #  1  #
#  B (Paper)     #  Y (Paper)     #  2  #
#  C (Scissors)  #  Z (Scissors)  #  3  #
#########################################

########################
#        Part 1        #
########################
#  X (Rock)      #  1  #
#  Y (Paper)     #  2  #
#  Z (Scissors)  #  3  #
########################

##################
# Outcome Points #
##################
#   Lose   #  0  #
#   Draw   #  3  #
#   Win    #  6  #
##################

#######################################
#               Part 1                #
#             Score Table             #
#######################################
# A (rock)     X (rock)     # 1+3 # 4 #
# A (rock)     Y (paper)    # 2+6 # 8 #
# A (rock)     Z (scissors) # 3+0 # 3 #
#######################################
# B (paper)    X (rock)     # 1+0 # 1 #
# B (paper)    Y (paper)    # 2+3 # 5 #
# B (paper)    Z (scissors) # 3+6 # 9 #
#######################################
# C (scissors) X (rock)     # 1+6 # 7 #
# C (scissors) Y (paper)    # 2+0 # 2 #
# C (scissors) Z (scissors) # 3+3 # 6 #
#######################################

####################
#      Part 2      #
####################
#  X (Lose)  #  0  #
#  Y (Draw)  #  3  #
#  Z (Win)   #  6  #
####################

#######################################
#               Part 2                #
#            Score Table              #
#######################################
# A (rock)     X (scissors) # 3+0 # 3 #
# A (rock)     Y (rock)     # 1+3 # 4 #
# A (rock)     Z (paper)    # 2+6 # 8 #
#######################################
# B (paper)    X (rock)     # 1+0 # 1 #
# B (paper)    Y (paper)    # 2+3 # 5 #
# B (paper)    Z (scissors) # 3+6 # 9 #
#######################################
# C (scissors) X (paper)    # 2+0 # 2 #
# C (scissors) Y (scissors) # 3+3 # 6 #
# C (scissors) Z (rock)     # 1+6 # 7 #
#######################################

$input_file = 'input.txt' ;
$total_score_1 = 0 ;
$total_score_2 = 0 ;

# read in input file
open(FH, '<', $input_file) 
  or die $!;

# Loop through inputs
while(<FH>) {
	chomp($line = $_) ;
	printf("Line: %s\n", $line);

	# totals for Part 1
	($line eq "A X") ? ($total_score_1 += 4) : ($total_score_1) ;
	($line eq "A Y") ? ($total_score_1 += 8) : ($total_score_1) ;
	($line eq "A Z") ? ($total_score_1 += 3) : ($total_score_1) ;

	($line eq "B X") ? ($total_score_1 += 1) : ($total_score_1) ;
	($line eq "B Y") ? ($total_score_1 += 5) : ($total_score_1) ;
	($line eq "B Z") ? ($total_score_1 += 9) : ($total_score_1) ;

	($line eq "C X") ? ($total_score_1 += 7) : ($total_score_1) ;
	($line eq "C Y") ? ($total_score_1 += 2) : ($total_score_1) ;
	($line eq "C Z") ? ($total_score_1 += 6) : ($total_score_1) ;

	# totals for Part 2
	($line eq "A X") ? ($total_score_2 += 3) : ($total_score_2) ;
	($line eq "A Y") ? ($total_score_2 += 4) : ($total_score_2) ;
	($line eq "A Z") ? ($total_score_2 += 8) : ($total_score_2) ;

	($line eq "B X") ? ($total_score_2 += 1) : ($total_score_2) ;
	($line eq "B Y") ? ($total_score_2 += 5) : ($total_score_2) ;
	($line eq "B Z") ? ($total_score_2 += 9) : ($total_score_2) ;

	($line eq "C X") ? ($total_score_2 += 2) : ($total_score_2) ;
	($line eq "C Y") ? ($total_score_2 += 6) : ($total_score_2) ;
	($line eq "C Z") ? ($total_score_2 += 7) : ($total_score_2) ;


}

# output total score
printf("Total (part 1): %s\n", $total_score_1) ;
printf("Total (part 2): %s\n", $total_score_2) ;
