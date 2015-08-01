#!/usr/bin/env perl
# library: PDL::Graphics::Gnuplot
# language: Perl5

use strict;
use warnings;

use PDL;
use PDL::Graphics::Gnuplot;

my $output_file = $ARGV[0];

my $plot = PDL::Graphics::Gnuplot->new();

my $x = sequence(101) - 50;
my $y = $x**2;

$plot->plot( $x, $y);

if( $output_file ) {
	$plot->output( 'pngcairo', solid=>1, color=>1,font=>'Arial,10',size=>[11,8.5,'in'] );
	$plot->replot( hardcopy => $output_file );
	$plot->close;
}

1;
