package Net::Salesforce::Model::Account;

use Mojo::Base 'Net::Salesforce::Client';
use Mojo::URL;
use DDP;

has 'sobject' => 'Account';

sub by_account_number {
    my ($self, $account_number) = @_;
    my $url = $self->api_url->path($self->sobject . "/$account_number");
    my $res = $self->get($url);
    return $self->json->decode($res);
}

sub by_name {
    my ($self, $name) = @_;
    "by_name() not implemented yet.";
}

1;
__END__

=encoding utf-8

=head1 NAME

Net::Salesforce::Client - Salesforce.com client utilities

=head1 SYNOPSIS

  use Net::Salesforce::Client;

=head1 DESCRIPTION

Net::Salesforce::Client is a perl interface to Salesforce.com JSON api.

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

=head1 ATTRIBUTES

=head2 name

=head2 assets

=head2 cases

=head1 AUTHOR

Adam Stokes E<lt>adamjs@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2014- Adam Stokes

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
