#! /usr/bin/perl
#######################################################################
# $Id: bin-timestampz.t,v 1.6 2010-12-01 06:47:38 dpchrist Exp $
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

use Test::More tests		=> 1;

use strict;
use warnings;

use Carp;
use Config;
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
    my $path_to_perl = $Config{perlpath};

    $r = eval {
	$line = catfile 'perl-bin', 'timestampz';
	qx/$path_to_perl $line/;
    };
    ok (							#     1
	!$@
	&& defined $r
	&& $r =~ /^\d{8}T\d{6}Z\n$/,
	'verify basic format'
    ) or confess join(' ',
	Data::Dumper->Dump([$@, $line, $r, $!],
			 [qw(@   line   r   !)]),
    );
}

#######################################################################
