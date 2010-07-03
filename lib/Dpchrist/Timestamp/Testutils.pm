#! /usr/bin/perl
#######################################################################
# $Id: Testutils.pm,v 1.2 2010-06-06 01:22:57 dpchrist Exp $
#
# Utility functions for Dpchrist-Timestamp test scripts.
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
# package stuff:
#----------------------------------------------------------------------

package Dpchrist::Timestamp::Testutils;

use strict;
use warnings;

use Exporter qw( import );

our @EXPORT = qw(
    array_equal
    within_one
);

#######################################################################
# uses:
#----------------------------------------------------------------------

use Data::Dumper;
$Data::Dumper::Sortkeys = 1;

#######################################################################
# subroutines:
#----------------------------------------------------------------------

sub array_equal
{
    my ($ra, $rb) = @_;
    warn( Data::Dumper->Dump([$ra, $rb], [qw(ra rb)]) )
	if $ENV{DEBUG};

    my $retval = (scalar @$ra == scalar @$rb);

    if ($retval) {
	for(my $i = 0; $i < scalar @$ra; $i++) {
	    my $a = $ra->[$i] + 0;
	    my $b = $rb->[$i] + 0;
	    warn( Data::Dumper->Dump([$a, $b], [qw(a b)]) )
		if $ENV{DEBUG};
	    $retval &&= ($a == $b);
	}
    }

    return $retval;
}

#----------------------------------------------------------------------

sub within_one
{
    my ($a, $b) = @_;

    return $a - 1 <= $b
        &&           $b <= $a + 1;
}

#######################################################################
# end of code:
#----------------------------------------------------------------------

1;

#######################################################################
