# print out arithmetic mean, standard deviation, and standard error of column 1

BEGIN { n = 0; s = 0; ss = 0; }

{ n++; s += $1; ss += $1*$1;
  if (NR == 1) {
    min = $1; max = $1
  } else {
    if ($1 < min) min = $1;
    if ($1 > max) max = $1;
  }
}
END {

  print n " data points"
  print min " minimum"
  m = (s+0.0)/n; print m " average"
  print max " maximum"
  sd = sqrt( (ss - n * m * m) / ( n - 1.0))
  print sd " standard deviation"
  se = sd/sqrt(n)
  print se " standard error"
}
