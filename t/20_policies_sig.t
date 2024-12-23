
use 5.006001;

use strict;
use warnings;

use PPI::Document;
use Readonly;
use Test::More;
use Test::Perl::Critic::Policy qw< all_policies_ok >;

#-----------------------------------------------------------------------------

our $VERSION = '0.114';
Readonly::Scalar my $PPI_VERSION => 1.280;

#-----------------------------------------------------------------------------
# These tests require PPI version 1.280
# Note that as of December 23 2024 the current PPI is 1.279, and Perl::Critic
# requires 1.277.

{
    my $ppi_version = PPI::Document->VERSION;
    $ppi_version >= $PPI_VERSION
        or plan skip_all => "These tests require at least PPI $PPI_VERSION. You have $ppi_version";
}
#-----------------------------------------------------------------------------
# Notice that you can pass arguments to this test, which limit the testing to
# specific policies.  The arguments must be shortened policy names. When using
# prove(1), any arguments that follow '::' will be passed to the test script.

my %args = @ARGV ? ( -policies => [ @ARGV ] ) : ();
all_policies_ok( '-test-directory' => 'xt/Sig', %args );

#-----------------------------------------------------------------------------
# ensure we return true if this test is loaded by
# 20_policies.t_without_optional_dependencies.t

1;

#-----------------------------------------------------------------------------
# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=78 ft=perl expandtab shiftround :
