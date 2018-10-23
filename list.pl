#!/usr/bin/env perl

use warnings;
use strict;

print "# Adafruit CircuitPython Libraries\n\n";

open my $fh, '<', '.git/config';
local $/ = undef;
my $contents = <$fh>;

while ($contents =~ m{^\s+url = (https://github.com/adafruit/(.*?))[.]git$}msg) {
  my ($url, $human_readable, $pypi) = ($1, $2, $2);
  $human_readable =~ tr/_/ /;
  $pypi =~ tr/[A-Z]/[a-z]/;
  $pypi =~ tr/_/-/;
  print "* [$human_readable]($url) ([PyPI](https://pypi.org/project/$pypi))\n";
}
