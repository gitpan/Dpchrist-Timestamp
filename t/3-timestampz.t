#! /usr/bin/perl
#######################################################################
# $Id: 3-timestampz.t,v 1.3 2010-06-06 01:22:58 dpchrist Exp $
#
# Verify timestampz script output.
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

use Dpchrist::Timestamp;

use Test::More tests => 1;

#######################################################################
# script:
#----------------------------------------------------------------------

{
    my $line = "bin/timestampz";
    my $e = `$line`;
    chomp $e;
    if ($e && $e =~ /^\d{8}T\d{6}Z$/) {
	ok(1);
    }
    else {
	diag Data::Dumper->Dump([$line, $e, $!],
			      [qw(line   e   !)]);
	ok(0);
    }
}

#######################################################################
