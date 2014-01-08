package Net::Salesforce::Model::Account;

use Mojo::Base 'Net::Salesforce::Client';
use Mojo::URL;

has 'sobject' => sub {
  my $self = shift;
  return $self->api_url->path('sobjects/Account/');
};

has 'account';

sub by_account_number {
    my ($self, $account_number) = @_;
    my $url = $self->sobject->path($account_number);
    my $tx = $self->get($url);
    $self->account($self->get($url));
}

sub by_name {
    my ($self, $name) = @_;
    "by_name() not implemented yet.";
}

sub name {
    my $self = shift;
    return $self->account->{Name};
}

sub revenue {
    my $self = shift;
    return $self->account->{AnnualRevenue};
}

sub created_by_id {
    my $self = shift;
    return $self->account->{CreatedById};
}

sub created_date {
    my $self = shift;
    return $self->account->{CreatedDate};
}

sub description {
    my $self = shift;
    return $self->account->{Description};
}

sub owner_id {
    my $self = shift;
    return $self->account->{OwnerId};
}

sub phone {
    my $self = shift;
    return $self->account->{Phone};
}

sub ticker_symbol {
    my $self = shift;
    return $self->account->{TickerSymbol};
}

sub website {
    my $self = shift;
    return $self->account->{Website};
}

1;
__END__

=encoding utf-8

=head1 NAME

Net::Salesforce::Model::Account - Salesforce.com Account model

=head1 SYNOPSIS

  use Net::Salesforce::Client;
  my $account = $c->model('Account');

  say $account->description;

=head1 DESCRIPTION

Net::Salesforce::Model::Account is a perl interface to Salesforce.com Accounts api.

=head1 METHODS

=head2 by_account_number

   my $account = $sf->model('Account')->by_account_number('324324324324432');
   say "Account name: ". $account->name;
   say "Account created: ". $account->created;

Searches the Account namespace by account number, this is a query call that
must be made before accessing any attributes.

=head2 by_name

   my $account = $sf->model('Account')->by_name('Acme');
   say "Account name: ". $account->name;
   say "Account created: ". $account->created;

Searches the Account namespace by name, this is a query call that
must be made before accessing any attributes.

=head2 name

=head2 created_by_id

=head2 created_date

=head2 description

=head2 owner_id

=head2 phone

=head2 revenue

=head2 ticker_symbol

=head2 website

=head1 ATTRIBUTES

=head2 account

=head2 sobject

=head1 AUTHOR

Adam Stokes E<lt>adamjs@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2014- Adam Stokes

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
