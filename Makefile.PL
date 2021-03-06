use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Create CPAN::Mini mirror with recent developer releases",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "CPAN-Mini-Devel-Recent",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.006",
  "NAME" => "CPAN::Mini::Devel::Recent",
  "PREREQ_PM" => {
    "CPAN" => "1.92",
    "CPAN::HandleConfig" => 0,
    "CPAN::Mini" => "0.567",
    "CPAN::Tarzip" => 0,
    "File::Basename" => 0,
    "File::Path" => 0,
    "File::Spec" => "3.27",
    "File::Temp" => "0.20",
    "YAML::Syck" => "1.07",
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => "3.27",
    "Test::More" => 0
  },
  "VERSION" => "0.08",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "CPAN" => "1.92",
  "CPAN::HandleConfig" => 0,
  "CPAN::Mini" => "0.567",
  "CPAN::Tarzip" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Basename" => 0,
  "File::Path" => 0,
  "File::Spec" => "3.27",
  "File::Temp" => "0.20",
  "Test::More" => 0,
  "YAML::Syck" => "1.07",
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
