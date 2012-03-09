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
{ 
  count += 1
  line[count] = $0
  total += $1
  if ($1 + 0 > maxnum) {
    maxnum = $1 + 0
  }
}

END {
  stars = "**********************************************"
  biggestportion = maxnum / total
  for (i = 1; i <= count; ++i) {
    $0 = line[i]
    if ($1 > 0) {
       numstars = int($1/total*40/biggestportion+0.5)
       printf("%-40." numstars "s ", stars);
       print $0
    }
  }
}

