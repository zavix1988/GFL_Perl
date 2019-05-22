#!/usr/bin/perl -w

package Utilites::db;

use strict;
use DBI;
use Data::Dumper;


sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    my $host = 'dbi:mysql:host=127.0.0.1;dbname=user12;';
    my $user = 'user12';
    my $pass = 'user12';
    $self->{'dbh'} = DBI->connect($host, $user, $pass, {});
    print "Package Initialized\n";
    my $sql = qq{SET NAMES 'utf8';};
    $self->{'dbh'}->do($sql);
    return bless($self, $class);
}

sub select
{
    my ($self, $what, $tableName, $where) = @_;
    my $statmentString = 'SELECT ' . $what . ' FROM ' . $tableName;
    if ($where)
    {
        $statmentString .= " WHERE " . $where;
    }
    my $sth = $self->{'dbh'}->prepare($statmentString);
    my $cnt = $sth->execute();
    my @data_array;

    while (my $row=$sth->fetchrow_hashref())
    {
        push @data_array, $row;
    }
    $sth->finish();
    return @data_array;
}

sub insert
{
    my ($self, $tableName, $fields, $values) = @_;
    my $statmentString = 'INSERT INTO ' . $tableName 
                                        . ' (' . $fields . ') VALUES (' 
                                        . $values . ')';
    if ($self->{'dbh'}->do($statmentString))
    {
        return "Inserted successfully\n";
    }
    return "Not inserted\n";
}

sub delete
{
    my ($self, $tableName, $conditions) = @_;
    my $statmentString = 'DELETE FROM ' . $tableName . ' WHERE ' . $conditions;
    if ($self->{'dbh'}->do($statmentString))
    {
        return "Deleted successfully\n";
    }
    return "Not deleted\n";
}

sub update
{
    my ($self, $tableName, $toChange, $conditions) = @_;
    my $statmentString = 'UPDATE ' . $tableName . ' SET ' . $toChange . 'WHERE ' . $conditions;
    if ($self->{'dbh'}->do($statmentString))
    {
        return "Updated successfully\n";
    }
    return "Not updated\n";
}



sub DESTROY
{
    my ($self) = @_;
    $self->{'dbh'}->disconnect;
}

return 1;