#######################################################################
# $Id: Timestamp.pm,v 1.16 2010-11-27 07:37:16 dpchrist Exp $
#######################################################################
# package stuff:
#----------------------------------------------------------------------

package Dpchrist::Timestamp;

use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
    timestamp
    timestampz
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = ();

our $VERSION = sprintf "%d.%03d", q$Revision: 1.16 $ =~ /: (\d+)\.(\d+)/;

#######################################################################
# functions:
#----------------------------------------------------------------------

sub timestamp
{
    my ($sec, $min, $hour, $mday, $mon, $year) = localtime(time());
    $year += 1900;
    $mon += 1;

    return sprintf('%04i%02i%02i-%02i%02i%02i',
		   $year, $mon, $mday, $hour, $min, $sec);
}

#----------------------------------------------------------------------

sub timestampz
{
    my ($sec, $min, $hour, $mday, $mon, $year) = gmtime(time());
    $year += 1900;
    $mon += 1;

    return sprintf('%04i%02i%02iT%02i%02i%02iZ',
		   $year, $mon, $mday, $hour, $min, $sec);
}

#######################################################################
# end of module:
#----------------------------------------------------------------------

1;

__END__

#######################################################################

=head1 NAME

Dpchrist::Timestamp - generate time stamps


=head1 DESCRIPTION

This documentation describes module revision $Revision: 1.16 $.


This is alpha test level software
and may change or disappear at any time.


=head1 SYNOPSIS

In a Perl script:

    #! /usr/bin/perl
    use strict;
    use warnings;

    use Dpchrist::TimeStamp qw( :all );

    my $local_timestamp = timestamp();
    my $zulu_timestamp  = timestampz();

In a shell script:

    #! /usr/bin/bash

    LOCALTIMESTAMP=`timestamp`
    ZULUTIMESTAMP=`timestampz`


=head1 DESCRIPTION

This Perl library contains two functions,
I<timestamp()> and I<timestampz>(),
which return strings representing
the local time or UTC time (Zulu).

Local time time stamps are of the format "YYYYMMDD-hhmmss".

UTC time (Zulu) time stamps are of the format "YYYYMMDDThhmmssZ".

The distribution also includes Perl scripts named
I<timestamp> and I<timestampz>,
which print the corresponding strings to STDOUT (newline terminated)
for use in shell scripts, etc..

=head2 EXPORT

None by default.


=head1 INSTALLATION

Old school:

    $ perl Makefile.PL
    $ make    
    $ make test
    $ make install 

Minimal:

    $ cpan Dpchrist::Timestamp

Complete:

    $ cpan Bundle::Dpchrist

The following warning may be safely ignored:

    Can't locate Dpchrist/Module/MakefilePL.pm in @INC (@INC contains: /
    etc/perl /usr/local/lib/perl/5.10.0 /usr/local/share/perl/5.10.0 /us
    r/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10
    /usr/local/lib/site_perl .) at Makefile.PL line 22.


=head2 PREREQUISITES

See Makefile.PL in the source distribution root directory.


=head1 SEE ALSO

    Perl's time(), gmtime(), and localtime() functions
    timestamp
    timestampz


=head1 AUTHOR

David Paul Christensen dpchrist@holgerdanske.com


=head1 COPYRIGHT AND LICENSE

Copyright 2010 by David Paul Christensen dpchrist@holgerdanske.com

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; version 2.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307,
USA.

=cut

#######################################################################
