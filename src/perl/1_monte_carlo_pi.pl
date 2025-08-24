use strict;
use warnings;

my ($i,$count,$n)=(0,0,$ARGV[0]);
while($i<$n){
	my ($x,$y)=(int(rand()*10000)/10000,int(rand()*10000)/10000);
	if($x**2+$y**2<1){
		$count++;
	}
	$i++;
}
print 4 * ($count / $n);
