#!/usr/bin/perl
package SQL::QueryBuilder::Pretty::Database::MSSQL;
use base qw(SQL::QueryBuilder::Pretty);

use strict;
use warnings;

our $VERSION = '0.02';

use Carp qw(croak);
use Data::Dumper;

# /!\ MSSQL sub package (Quote) overwrite ANSI sub package (Quote)
SQL::QueryBuilder::Pretty->search_path( 
    new => 'SQL::QueryBuilder::Pretty::Database::MSSQL',
    add => 'SQL::QueryBuilder::Pretty::Database::ANSI',
);

1;
__END__
=head1 NAME

SQL::QueryBuilder::Pretty::Database::MSSQL - MSSQL extension for 
SQL::QueryBuilder::Pretty.

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

Directly: 

    use SQL::QueryBuilder::Pretty::Database::MSSQL;

    my $pretty = SQL::QueryBuilder::Pretty::Database::MSSQL->new();

    print $pretty->print('SELECT * FROM table WHERE col1 = NOW()');

or indirecly using SQL::QueryBuilder::Pretty:

    use SQL::QueryBuilder::Pretty;

    my $pretty = SQL::QueryBuilder::Pretty->new(
        '-database' => 'MSSQL',
    );

    print $pretty->print('SELECT * FROM table WHERE col1 = NOW()');

=head1 INHERITANCE

Is a L<SQl::QueryBuilder::Pretty>.

=head1 DESCRIPTION

MSSQL extension for SQL::QueryBuilder::Pretty.

=head1 SEE ALSO

L<SQL::QueryBuilder::Pretty>.

=head1 AUTHOR

Geoffroy Bruch, C<< <GeoffroyB at github.com> >>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2019 by Geoffroy Bruch.

=cut
