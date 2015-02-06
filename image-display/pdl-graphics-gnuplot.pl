#!/usr/bin/env perl
# library: PDL::Graphics::Gnuplot
# language: Perl5

use strict;
use warnings;

use PDL;
use PDL::Graphics::Gnuplot;
use Data::TestImage;

my $plot = PDL::Graphics::Gnuplot->new();

my $img_path = Data::TestImage->get_image('cameraman');
my $img = rim( ~~ $img_path );

$plot->imag( $img, { palette => 'gray' } );

<>;

1;
