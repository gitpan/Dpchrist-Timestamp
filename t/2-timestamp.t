#! /usr/bin/perl
#######################################################################
# $Id: 2-timestamp.t,v 1.3 2010-06-06 01:22:58 dpchrist Exp $
#
# Verify timestamp() function.
#
# Copyright 2010 by David Paul Christensen dpchrist@holgerdanske.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307,
# USA.
#######################################################################
# uses:
#----------------------------------------------------------------------

use strict;
use warnings;

use Data::Dumper;
$Data::Dumper::Sortkeys = 1;

use Dpchrist::Timestamp qw( timestamp );
use Dpchrist::Timestamp::Testutils;

use Test::More tests => 2;

#######################################################################
# main script:
#----------------------------------------------------------------------

{
    ###### ($sec, $min, $hour, $mday, $mon, $year)
    my @v = (localtime(time()))[0..5];
    $v[5] += 1900;
    $v[4]  += 1;
    diag( Data::Dumper->Dump([\@v], [qw(*v)]) )
	if $ENV{DEBUG};

    my $got = timestamp();
    diag( Data::Dumper->Dump([$got], [qw(got)]) )
	if $ENV{DEBUG};

    like($got, qr/^\d{8}-\d{6}$/,				#     1
	 "verify basic format");

    $got =~ m|^(\d\d\d\d)(\d\d)(\d\d)-(\d\d)(\d\d)(\d\d)$|;
    my @vgot = ($6, $5, $4, $3, $2, $1);
    diag( Data::Dumper->Dump([\@vgot], [qw(*vgot)]) )
	if $ENV{DEBUG};

    if ($v[0] != $vgot[0]) {
	diag("possible time slew detected");
    	$v[0] = ($v[0] + 1) % 60;
	if ($v[0] == 0) {
	    diag("possible minutess rollover detected");
	    $v[1] = ($v[1] + 1) % 60;
	    if ($v[1] == 0) {
		diag("possible hours rollover detected");
		$v[2] = ($v[2] + 1) % 24;
		if ($v[2] == 0) {
		    $v[3] += 1;	# breaks on end of month
		}
	    }
	}
    }

    								#     2
    ok( array_equal(\@v, \@vgot), 'verify timestamp() against clock')
	or diag( Data::Dumper->Dump([\@v, $got, \@vgot],
				  [qw(*v   got   *vgot)]) );
}

#######################################################################
