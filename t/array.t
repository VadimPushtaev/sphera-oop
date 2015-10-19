use strict;
use warnings;

use Test::More tests => 5;

use Local::Iterator::Array;

my $iterator = Local::Iterator::Array->new(array => [1, 2, 3]);

my ($next, $end);

($next, $end) = $iterator->next();
is($next, 1, 'next value');
ok(!$end, 'not end');

is_deeply($iterator->next_n(5), [2, 3], 'next_n (overflow)');

($next, $end) = $iterator->next();
is($next, undef, 'no value');
ok($end, 'end');
