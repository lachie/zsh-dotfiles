#!/usr/bin/perl

my $pwd = $ENV{PWD};
my $home = $ENV{HOME};

sub squish {
  my @parts = split /\//, $_[0];
  my $last = pop @parts;
  join '/', ( map {s/^(\.?[^\/])[^\/]*/\1/; $_} @parts ), $last;
}

$pwd = "/tmp" if $pwd =~ "^/private/tmp";

if($pwd =~ /$home(.*)/) {
  print '~' . squish($1);
} else {
  print squish($pwd);
}
