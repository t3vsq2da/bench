$n = $ARGV[0];
#$c = 0;
$c += rand()**2 + rand()**2 < 1 for 1..$n;
print 4 * $c / $n;
