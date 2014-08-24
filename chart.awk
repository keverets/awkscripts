# Make barcharts out of the first field
# Takes input:
#
# 10 x
# 40 y
# 50 z
#
# and produces:
#
# ********                                 10 x
# ********************************         40 y
# **************************************** 50 z
#
# Personalize by specifying `width`, the `star` character and `justify`

BEGIN {
	star = "+" #interesting choices: |-_=*+o
	justify = "" #use - for left-justifying, blank for right-justifying
	width = 50
}

{ 
	count += 1
	line[count] = $0
	total += $1
	if ($1 + 0 > maxNum) {
		maxNum = $1 + 0
	}
}

END {
	for (i = 1; i <= width; i++)
		stars = stars star
	maxStars = maxNum / total

	for (i = 1; i <= count; ++i) {
		$0 = line[i]
		if ($1 > 0) {
			numStars = int($1 * width/maxNum)
			printf("%" justify width "." numStars "s ", stars);
			print $0
		}
	}
}
