use strict;
use warnings;

use Test::More tests => 7;

use Local::Iterator::Array;
use Local::Iterator::Aggregator;

my $iterator = Local::Iterator::Aggregator->new(
    iterator => Local::Iterator::Array->new(array => [1, 2, 3, 4, 5, 6, 7]),
    chunk_length => 2,
);

my ($next, $end);

($next, $end) = $iterator->next();
is_deeply($next, [1, 2], 'full chunk');
ok(!$end, 'not end');

is_deeply(
    $iterator->next_n(2),
    [[3, 4], [5, 6]],
    'next_n'
);

($next, $end) = $iterator->next();
is_deeply($next, [7], 'truncated chunk');
ok(!$end, 'still not end');

($next, $end) = $iterator->next();
is($next, undef, 'no value');
ok($end, 'end');
