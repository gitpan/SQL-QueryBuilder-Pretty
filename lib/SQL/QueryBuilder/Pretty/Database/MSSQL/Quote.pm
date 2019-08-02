#!/usr/bin/perl
package SQL::QueryBuilder::Pretty::Database::MSSQL::Quote;
use base qw(SQL::QueryBuilder::Pretty::Rule);

use strict;
use warnings;

our $VERSION = '0.01';

use Carp qw(croak);
use Data::Dumper;

sub order { return 20 }

sub match { 
    return qr/
        \'\'(?!\')
        |
        \"\"(?!\"")
        |
        ".*?(?:(?:""){1,}"|(?<!["])"(?!"))
        |
        '.*?(?:(?:''){1,}'|(?<!['])'(?!'))
        |
        \[(?:[^\]]|\]\])+\]
    /x;
}

1;
__END__
=head1 NAME

SQL::QueryBuilder::Pretty::Database::MSSQL::Quote - Rule to process MSSQL 
quotes.

=head1 VERSION

Version 0.01

=head1 INHERITANCE

Is a L<SQL::QueryBuilder::Pretty::Rule>.

=head1 DESCRIPTION

Rule to process MSSQL quotes.

=head2 METHODS

=over 4

=item I<PACKAGE>->new()

Initializes the object.

=item I<$obj>->action($print_object, $token)

THe action to be executed on match. Must return 1 to skip the next rules.

$print_object is a L<SQL::QueryBuilder::Pretty::Print> object.

$token is the result of the match.

=item I<$obj>->match

Returns the match regular expression for this rule.

=item I<$obj>->name

Returns the name of the rule. By default the pm file. Not used yet.

=item I<$obj>->order

Returns the order value for this rule. Default is 999.

=item I<$obj>->type

Returns the type of this rule. Not used yet.

=back

=head1 SEE ALSO

L<SQL::QueryBuilder::Pretty>, L<SQL::QueryBuilder::Pretty::Print>
and L<SQL::QueryBuilder::Pretty::Rule>.

=head1 AUTHOR

Geoffroy Bruch, C<< <GeoffroyB at cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2019 by Geoffroy Bruch. Published under the terms of 
the Artistic License 2.0.

=cut
