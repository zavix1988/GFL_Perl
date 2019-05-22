#! /usr/bin/perl -w

use Data::Dumper;

@myArr = qw(1 2 3 4);
$var1 = @myArr;
($var2) = @myArr;
print $var1;
print "\n";
print $var2;
print "\n";

#$refArr = \@myArr;

print Dumper(@myArr);