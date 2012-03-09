# cat foo | awk -f quantize.awk

{ 
  b = int(log($1) / log(2));
  if (sawone != 1) {
    sawone = 1;
    minb = b;
    maxb = b;
  } else {
    if (b < minb) minb = b;
    if (b > maxb) maxb = b;
  }
  ++f[b];
  ++total;
}

END {
  printf("%10s %s\n", "value","------------- Distribution ------------- count");
  stars = "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
  for (i = minb-1; i <= maxb+1; ++i) {
    numstars = int(f[i]/total*40+0.5);
    if (f[i] > 0) {
      printf("%10d %-40." numstars "s %d\n", 2^i, stars, f[i]);
    } else {
      printf("%10d %40s %d\n", 2^i, " ", 0);
    }
  }
}

