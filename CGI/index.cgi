#!/usr/bin/perl -w
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser); # позволит выводить ошибки в браузер
use vars qw(%in);
use Data::Dumper;
use File::Basename qw(dirname);
use lib dirname(__FILE__);


$|=1; # отключаем буферизацию ввода данных;
ReadParse(); # получает данные из HTML формы в  хэш %in

# вариант хедера, используется перед выводом в браузер
print "Content-type: text/html; charset=utf-8\n\n";
#print "Hello, world";
print "<pre>";
print Dumper(\%in);
print "</pre>";
print "<pre>";
print Dumper(\%ENV);
print "</pre>";

my $filename = 'index.html';
unless (%in){
    open(my $fh, '<:encoding(UTF-8)', $filename);
    local $/ = undef;
    my $html = <$fh>;
    close $fh;
    print $html;
}