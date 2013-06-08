#######################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/distributions/Perl-Critic/Build.PL $
#     $Date: 2011-03-31 20:00:29 -0400 (Thu, 31 Mar 2011) $
#   $Author: clonezone $
# $Revision: 4060 $
########################################################################

use 5.006001;

use strict;
use warnings;

use lib 'inc';

use My::Module::Build;
use My::Module::Meta qw{
    build_required_module_versions
    recommended_module_versions
    required_module_versions
};

my $builder = My::Module::Build->new(
    module_name         => 'Perl::Critic::Policy::Variables::ProhibitUnusedVarsStricter',
    dist_author         => 'Thomas R. Wyant, III (wyant at cpan dot org)',
    dist_abstract       => 'Critique unused variables in Perl source',
    license             => 'perl',
    create_packlist     => 1,
    sign                => 0,

    requires            => { required_module_versions() },
    build_requires      => { build_required_module_versions() },
    recommends          => { recommended_module_versions() },

    # Don't require a developer version of Module::Build, even if the
    # distribution tarball was created with one.  (Oops.)
    configure_requires  => {
        'Module::Build' => '0.34',
    },

    meta_merge          => {
        resources   => {
#           homepage    => 'http://perlcritic.com',
            license     => 'http://dev.perl.org/licenses/',
#           repository  => 'http://guest@perlcritic.tigris.org/svn/perlcritic/trunk/distributions/Perl-Critic/',
#           MailingList => 'http://perlcritic.tigris.org/servlets/SummarizeList?listName=users',
        },
        no_index        => {
            file        => [
                qw<
                    TODO.pod
                >
            ],
            directory   => [
                qw<
                    doc
                    examples
                    inc
                    tools
                    xt
                >
            ],
        },
    },

    add_to_cleanup      => [
        qw<
            Debian_CPANTS.txt
        >,
    ],
    create_makefile_pl  => 'traditional',
);

$builder->create_build_script();


##############################################################################
# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=78 ft=perl expandtab shiftround :
