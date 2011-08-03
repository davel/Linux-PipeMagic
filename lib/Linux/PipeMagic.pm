package Linux::PipeMagic;

use 5.010001;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Linux::PipeMagic ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
    systee
    syssplice
);

our $VERSION = '0.01';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&Linux::PipeMagic::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
#XXX	if ($] >= 5.00561) {
#XXX	    *$AUTOLOAD = sub () { $val };
#XXX	}
#XXX	else {
	    *$AUTOLOAD = sub { $val };
#XXX	}
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Linux::PipeMagic', $VERSION);

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

Linux::PipeMagic - Perl extension to use the zero copy IO syscalls

=head1 SYNOPSIS

  use Linux::PipeMagic qw/ systee syssplice /;
  systee($fh_in, $fh_out, $num_bytes, 0);
  syssplice($fh_in, $fh_out, $num_bytes, 0);


=head1 DESCRIPTION



Blah blah blah.

=head1 SEE ALSO

=over

=item *
L<http://github.com/davel/Linux-PipeMagic/>

=item *
L<splice(2)>

=item *
L<tee(2)>

=back

=head1 AUTHOR

Dave Lambley, E<lt>cpan@davel.org.ukE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Dave Lambley

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
