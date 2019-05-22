#!/usr/bin/perl -w

use strict;
use Data::Dumper;
use Utilites::db;

my $obj = Utilites::db -> new();
#print $obj->insert('PerlTask', 'title, description', "'With Fire and Sword', 'Historical book about war on theritory of Poland And Ukraine'");
#print Dumper($obj->select('*', 'PerlTask'));
#print $obj->update('PerlTask', 'description=\'New description, dude!\'', 'title=\'With Fire and Sword\'');
#print Dumper($obj->select('*', 'PerlTask'));
#print $obj->delete('PerlTask', 'title=\'With Fire and Sword\'');
print Dumper($obj->select('*', 'books'));