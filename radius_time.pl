#!/usr/bin/perl
#
#       Script to test the speed of client's authentification on radius
#
#       V 1.0   Dev initial - Johan Denoyer - 30/07/2013
#
#

use strict;
use Authen::Radius;
use Time::HiRes qw(gettimeofday );

my $host = $ARGV[0];
my $secret = $ARGV[1];
my $user = $ARGV[2];
my $pass = $ARGV[3];

if ($user eq '') { $user='supervision\@domain';}
if ($pass eq '') { $pass='password';}

if (@ARGV < 4) {
	print "Error, you have not defined a radius host, secret, user and password\n";
	print "Usage : ".$0." radius_ip radius_secret radius_user radius_user_password\n\n";
	print "Default values :";
	print "radius_user => default : supervision\@domain\n";
	print "radius_password => default : password\n";
	exit(1);
}

my $start = gettimeofday();
my $r = new Authen::Radius(Host => $host, Secret => $secret);
$r->check_pwd($user, $pass);
$r->check_pwd($user, $pass);
$r->check_pwd($user, $pass);
my $end = gettimeofday();
my $diff=($end - $start)/3;
printf("%.3f\n", $diff);
