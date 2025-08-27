#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper 'Dumper';
#name | (extenion,interpreter|create_exe(src,flags_str),(flags,flags,...))
my %langs=(
	python=>["py","python",[""]],
	perl=>["pl","perl",[""]],
	c=>["c",sub($$){
		cmd_exe("gcc $_[0] $_[1] -o ./exe");
	},["","-O2","-O3"]]
);
# name | check_condition(test_data,test_res)
my %tests=(
	"monte_carlo_pi"=>sub($$){#$_[1]>3&&$_[1]<4;
	1}
);

#cmd
sub cmd_exe($){
	print "@" . $_[0] . "\n";
	`$_[0]`;
}
sub measuring($$){
	#my $res = "$_[0] $_[1]";
	my $time_info = `taskset -c 0 time -v  $_[0] $_[1] 2>&1`;
	my @lines = split /\n/, $time_info;
	#for();
#	my $result = (split "\t", $lines[0])[0];
#	my $user_time = (split " ",$lines[1])[-1];
#	my $sys_time = (split " ",$lines[2])[-1];
#	print "res:$result\nuser_time${user_time}\nsys_time$sys_time\n";
}
sub test(){
	my %test_results;
	while(my ($test,$check) = each(%tests)){
		open("fh","./src/test_data/$test.txt") or die "can't open test_data";
		while(<fh>){
			chomp $_;
			my $test_data= $_;
			while(my ($lang,$lang_data) = each(%langs)){
				my ($ext,$compiler,$flags)=@$lang_data;
				my $src = "./src/$lang/$test.$ext";
				foreach my $flags_str (@$flags){
					#next if $flags_str eq "";
					my $result;
					if(ref $compiler eq 'CODE'){
						$compiler->($src,$flags_str);
						measuring("./exe",$test_data);
						#$test_data
					} else{
						#$result=cmd_exe("$compiler $src $flags_str $test_data");
					}
					my $is_correct_res=$check->($test_data,$result)+0;
					$test_results{$test}{$test_data}{$lang}{$flags_str}={
						result=>$result,
						correct=>$is_correct_res
					};
				}
			}
		}
	}
	%test_results;
}
my $r = \test();
$Data::Dumper::Terse=1;
print "test_results:\n".substr(Dumper($r),1);
#print keys $r;
