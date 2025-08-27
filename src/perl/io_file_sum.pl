open F,$ARGV[0];
open O,">output.txt";
for(<F>){$s=0;$s+=$_ for split;print O $s,$/}
