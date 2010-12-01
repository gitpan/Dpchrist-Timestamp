#! /usr/bin/perl
#######################################################################
# $Id: timestampz.t,v 1.5 2010-12-01 06:47:38 dpchrist Exp $
#
# Verify timestampz() function.
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

use Test::More tests => 2;

use strict;
use warnings;

use Carp;
use Data::Dumper;
use Dpchrist::Timestamp		qw( timestampz );
use Dpchrist::LangUtil		qw( arrayref_cmp );

$|				= 1;
$Data::Dumper::Sortkeys		= 1;

#######################################################################
# main script:
#----------------------------------------------------------------------

{
    my ($r, @r, @t);

    ###### ($sec, $min, $hour, $mday, $mon, $year)
    @t = (localtime(time()))[0..5];
    $t[5] += 1900;
    $t[4]  += 1;

    $r = eval {
	timestampz();
    };
    ok (							#     1
	!$@
	&& defined $r
	&& $r =~ /^\d{8}T\d{6}Z$/,
	 "verify basic format"
    ) or confess join(' ',
	Data::Dumper->Dump([$@, $r], [qw(@ r)]),
    );

    $r =~ /^(\d\d\d\d)(\d\d)(\d\d)T(\d\d)(\d\d)(\d\d)Z$/;
    @r = ($6, $5, $4, $3, $2, $1);

    ok (							#     2
	arrayref_cmp(\@r, \@t)
	|| abs($r[0] - $t[0]) % 60 < 2
	   && abs($r[1] - $t[1]) % 60 < 2
	   && abs($r[2] - $t[2]) % 24 < 2,
	'verify timestampz() against clock - can fail at midnight'
    ) or confess join(' ',
	Data::Dumper->Dump([$@, \@r, \@t], [qw(@ *r *t)])
    );
}

#######################################################################
