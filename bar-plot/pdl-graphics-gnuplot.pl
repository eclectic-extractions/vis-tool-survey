#!/usr/bin/env perl
# library: PDL::Graphics::Gnuplot
# language: Perl5

use strict;
use warnings;

use PDL;
use PDL::Graphics::Gnuplot;

my $plot = PDL::Graphics::Gnuplot->new();

my $x = sequence(5)+1;
my $y = pdl [1,2,1,3,4];

$plot->plot( with => 'boxes', $x, $y, { yrange => [0,5], xrange => [0,6] } );

<>;

1;
