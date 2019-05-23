#!/usr/bin/perl -w

use strict;
use Data::Dumper;
use Utilites::db;

my $obj = Utilites::db -> new();
#print $obj->insert('books', 'title, description', "'With Fire and Sword', 'Historical book about war on theritory of Poland And Ukraine'");
print $obj->insert('books', 'name, description, slug', "'With Fire and Sword', 'Historical book about war on theritory of Poland And Ukraine'");
#print Dumper($obj->select('*', 'books'));
#print $obj->update('books', 'description=\'New description, dude!\'', 'title=\'With Fire and Sword\'');
#print Dumper($obj->select('*', 'books'));
#print $obj->delete('books', 'title=\'With Fire and Sword\'');
print Dumper($obj->select('*', 'books'));

