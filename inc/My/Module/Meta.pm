package My::Module::Meta;

use 5.006001;

use strict;
use warnings;

use Carp;

use base qw{ Exporter };

our $VERSION = '0.003';

our @EXPORT_OK = qw{
    build_required_module_versions
    required_module_versions
    required_perl_version
    recommended_module_versions
};

sub required_module_versions {
    my @args = @_;
    return (
        'base'                      => 0,
        'strict'                    => 0,
        'warnings'                  => 0,
        'Perl::Critic::Document'    => 1.119,   # need 1.119 here
        'Perl::Critic::Policy'      => 1.119,
        'Perl::Critic::Utils'       => 1.119,
        'PPI::Token::Symbol'        => 0,
        'Readonly'                  => 0,
        'Scalar::Util'              => 0,
        @args,
    );
}

sub build_required_module_versions {
    return (
        'lib'       => 0,
        'Carp'      => 0,
    );
}

sub recommended_module_versions {
    return (
        'Readonly::XS'  => 0,
        'File::Which'   => 0,
    );
}

sub required_perl_version {
    return '5.006001';
}


1;

__END__

=head1 NAME

My::Module::Meta - Metadata for the current module

=head1 SYNOPSIS

 use lib qw{ inc };
 use My::Module::Meta qw{ recommended_module_versions };

=head1 DESCRIPTION

This Perl module holds metadata for the current module. It is private to
the current module.

=head1 SUBROUTINES

No subroutines are exported by default, but the following subroutines
are exportable:

=head2 build_required_module_versions

This subroutine returns an array of the names and versions of modules
required for the build.

=head2 recommended_module_versions

This subroutine returns an array of the names and versions of
recommended modules.

=head2 required_module_versions

This subroutine returns an array of the names and versions of required
modules. Any arguments will be appended to the returned list.

=head2 required_perl_version

This subroutine returns the version of Perl required by the module.

=head1 SUPPORT

Support is by the author. Please file bug reports at
L<http://rt.cpan.org>, or in electronic mail to the author.

=head1 AUTHOR

Thomas R. Wyant, III F<wyant at cpan dot org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013-2014 by Thomas R. Wyant, III

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl 5.10.0. For more details, see the full text
of the licenses in the directory LICENSES.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=cut

##############################################################################
# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 72
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=72 ft=perl expandtab shiftround :

