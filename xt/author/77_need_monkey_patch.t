package main;

use 5.006001;

use strict;
use warnings;

use Test::More 0.88;	# Because of done_testing();

eval {
    require Perl::Critic::Document;
    1;
} or plan skip_all => 'Can not load Perl::Critic::Document';

my $got_version = Perl::Critic::Document->VERSION();

$got_version =~ s/_//g;

my $want_version = 1.118;

cmp_ok $got_version, '<=', $want_version,
    "Perl::Critic::Document has not been updated past $want_version"
    or diag <<"EOD";
Perl::Critic::Document has been updated. You need to check to see if the
monkey-patched __element_is_in_lexical_scope_after_statement_containing
is still needed, or whether the public version that comes with
Perl::Critic::Document is now acceptable.
EOD

done_testing;

1;

# ex: set textwidth=72 :
