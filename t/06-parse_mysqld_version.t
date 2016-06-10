use strict;
use warnings;

use Test::More;
use Test::mysqld;
use version;

my @version_strings = (
    [qv(5.7.12), q|mysqld  Ver 5.7.12 for osx10.10 on x86_64 (Homebrew)|],
    [qv(5.0.95), q|/usr/libexec/mysqld  Ver 5.0.95-log for redhat-linux-gnu on i386 (Source distribution)|],
);

plan tests => scalar @version_strings;

for my $s (@version_strings) {
    is $s->[0], Test::mysqld->_parse_mysqld_version($s->[1]);
}
