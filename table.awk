# Draws boxes around fields to make a pretty-printed table
#
# Use with, eg: cat foo.txt | mawk -F"	" -f table.awk
# To take a tab-delimited file and print it with a table around the fields
#
# Given input like:
#
# android 1       10
# blackberry      2       100
# iphone  3       1000
#
# Transforms it into:
# +------------+---+------+
# | android    | 1 | 10   |
# | blackberry | 2 | 100  |
# | iphone     | 3 | 1000 |
# +------------+---+------+

{
  if (!match($1, "^-+$")) {
    count += 1
    line[count] = $0
    for (i = 1; i <= NF; ++i) {
      if (length($i) > field_width[i])
        field_width[i] = length($i)
    }
  }
}

function separator_line ( widths ) {
  dashes = "--------------------------------------------------------------------------------------"
  printf("+")
  for (column in widths) {
    printf("%-." field_width[column] + 2 "s+", dashes)
  }
  printf("\n")
}

END {
  separator_line(field_width)
  for (i = 1; i <= count; ++i) {
    $0 = line[i]
    printf("|")
    for (column in field_width)
      printf(" %-" field_width[column] + 1 "s|", $column)
    printf("\n")
  }
  separator_line(field_width)
}
