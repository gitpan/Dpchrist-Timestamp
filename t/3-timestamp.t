#! /usr/bin/perl
#######################################################################
# $Id: 3-timestamp.t,v 1.4 2010-11-30 06:38:06 dpchrist Exp $
#
# Verify timestamp script output.
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

use Test::More tests		=> 1;

use strict;
use warnings;

use Carp;
use Data::Dumper;
use Dpchrist::Timestamp;
use File::Spec::Functions;

$|				= 1;
$Data::Dumper::Sortkeys		= 1;

#######################################################################
# script:
#----------------------------------------------------------------------

{
    my ($r, $line);

    $r = eval {
	$line = catfile 'bin', 'timestamp';
	`$line`;
    };
    ok (
	!$@
	&& defined $r
	&& $r =~ /^\d{8}-\d{6}\n$/
    ) or confess join(' ',
	Data::Dumper->Dump([$@, $line, $r, $!],
			 [qw(@   line   r   !)]),
    );
}

#######################################################################
