package Net::Salesforce::Client;

use Mojo::Base -base;
use Mojo::UserAgent;
use Mojo::JSON qw(decode_json encode_json);;
use Mojo::URL;
use Class::Load ':all';

our $VERSION = '0.01';

has 'access_token';

has 'api_version' => 'v27.0';

has 'api_host' => 'https://na15.salesforce.com/';

has 'ua' => sub {
    my $self = shift;
    my $ua   = Mojo::UserAgent->new;
    $ua->transactor->name("Net::Salesforce/$VERSION");
    $ua->on(start => sub {
        my ($ua, $tx) = @_;
        $tx->req->headers->authorization('Bearer ' . $self->access_token);
    });
    return $ua;
};

sub api_url {
    my $self = shift;
    my $url = Mojo::URL->new($self->api_host);
    # Construct to URL to resemble
    # https://na15.salesforce.com/services/data/v27.0/sobjects/Account/001200000fdsaj
    return $url->path('services/data/')->path($self->api_version.'/');
}

sub sobjects {
    my $self = shift;
    # Constructs sobjects url
    # https://na15.salesforce.com/services/data/v27.0/sobjects
    my $tx   = $self->get($self->api_url->path("sobjects"));
    return $tx;
}

sub get {
    my ($self, $url) = @_;
    my $tx =
      $self->ua->get(
        $url->to_string
      );
    return decode_json($tx->res->body);
}

sub post {
    my ($self, $url, $body) = @_;

    my $tx = $self->ua->post(
      $url->to_string => {Accept => '*/*'} => json => $body
    );
    return decode_json($tx->res->body);
}

sub model {
    my ($self, $class) = @_;
    my $model = "Net::Salesforce::Model::$class";
    return load_class($model)->new($self);
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

=head1 ATTRIBUTES

=head2 access_token

Access token received from authenticating with L<Net::Salesforce>.

=head2 api_version

Current supported API version from Salesforce

=head2 api_host

Salesforce domain where your application lives, e.g. Developer force usually uses

  https://na17.salesforce.com/

=head2 ua

A L<Mojo::UserAgent> object.

=head2 json

A L<Mojo::JSON> object.

=head1 METHODS

=head2 api_url

Salesforce API url for accessing sobjects

=head2 model

Select model namespace you wish to query, e.g. 'Account'

=head2 sobjects

Retrieve list of available sobjects

=head2 get

Perform authenticated requests against Salesforce API

=head1 INSTALL

  $ cpanm git://github.com/battlemidget/Net-Salesforce-Client.git

If you'd wish to try out the latest code base you can do so with above
command.

=head1 AUTHOR

Adam Stokes E<lt>adamjs@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2014- Adam Stokes

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
