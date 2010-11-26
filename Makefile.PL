#######################################################################
# $Id: Makefile.PL,v 1.9 2010-11-26 20:34:45 dpchrist Exp $
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

use ExtUtils::MakeMaker;

use Dpchrist::Module::MakefilePL (
    -mcpani		=> $ENV{CPAN_AUTHORID},
    -pod2html	 	=> [ qw(
	lib/Dpchrist/Timestamp.pm
	bin/timestamp
	bin/timestampz
    ) ],
    -readme	 	=> qw( lib/Dpchrist/Timestamp.pm ),
    -release		=> $ENV{RELEASE_ROOT},
);

WriteMakefile(
    NAME              => 'Dpchrist::Timestamp',
    VERSION_FROM      => 'lib/Dpchrist/Timestamp.pm',
    PREREQ_PM         => {
	'Dpchrist::Module'	=> 1.023,
	'feature'		=> 0,
    },
    ABSTRACT_FROM	=> 'lib/Dpchrist/Timestamp.pm',
    AUTHOR		=>
	'David Paul Christensen <dpchrist@holgerdanske.com>',
    EXE_FILES		=> [
	'./bin/timestamp',
	'./bin/timestampz',
    ],
    clean		=> { FILES =>
	q( *~tmp */*~tmp Dpchrist* timestamp* ),
    },
);
