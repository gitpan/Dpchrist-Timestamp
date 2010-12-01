#! /usr/bin/perl
#######################################################################
# $Id: Dpchrist-Timestamp.t,v 1.3 2010-06-06 01:22:58 dpchrist Exp $
#
# Verify module can be use'd.
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

use Test::More tests => 1;

BEGIN { use_ok('Dpchrist::Timestamp') };

#######################################################################
