package main;

use 5.006;

use strict;
use warnings;

use Test::More 0.88;	# Because of done_testing();

eval {
    require ExtUtils::Manifest;
    1;
} or plan skip_all => 'Unable to load ExtUtils::Manifest';

eval {
    require Perl::MinimumVersion;
    1;
} or plan skip_all => 'Unable to load Perl::MinimumVersion';

use lib qw{ inc };
use My::Module::Meta;

my $min_perl = My::Module::Meta->requires_perl();

my $manifest = ExtUtils::Manifest::maniread();

foreach my $fn ( sort keys %{ $manifest } ) {
    $fn =~ m{ \A xt/ }smx
	and next;
    is_perl( $fn )
	or next;
    my $doc = Perl::MinimumVersion->new( $fn );
    cmp_ok $doc->minimum_version(), 'le', $min_perl,
	"$fn works under Perl $min_perl";
}

done_testing;

sub is_perl {
    my ( $fn ) = @_;
    $fn =~ m/ [.] (?: pm | t | pod | (?i: pl ) ) \z /smx
	and return 1;
    -f $fn
	and -T _
	or return 0;
    open my $fh, '<', $fn
	or return 0;
    local $_ = <$fh>;
    close $fh;
    return m/ perl /smx;
}

1;

# ex: set textwidth=72 :
