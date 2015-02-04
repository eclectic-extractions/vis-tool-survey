#!/usr/bin/env perl
# library: PDL::Graphics::Gnuplot
# language: Perl5

use strict;
use warnings;

use PDL;
use PDL::Graphics::Gnuplot;

my $plot = PDL::Graphics::Gnuplot->new();

my $x = sequence(101) - 50;
my $y = $x**2;

$plot->plot( $x, $y);

<>;

1;
