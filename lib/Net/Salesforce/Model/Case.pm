package Net::Salesforce::Model::Case;

use Mojo::Base 'Net::Salesforce::Client';
use Mojo::URL;

has 'sobject' => sub {
  my $self = shift;
  return $self->api_url->path('sobjects/Case/');
};

has 'case';

sub by_case_number {
    my ($self, $case_number) = @_;
    my $url = $self->sobject->path($case_number);
    $self->case($self->get($url));
}

1;
__END__

=encoding utf-8

=head1 NAME

Net::Salesforce::Model::Case - Salesforce.com Case model

=head1 SYNOPSIS

  use Net::Salesforce::Model::Case;

=head1 DESCRIPTION

Net::Salesforce::Model::Case is a perl interface to Salesforce.com case api.

=head1 METHODS

=head2 by_case_number

   my $case = $sf->model('Case')->by_case_number('324324324324432');
   say "Case name: ". $case->name;
   say "Case created: ". $case->created;

Searches the Case namespace by case number, this is a query call that
must be made before accessing any attributes.

=head2 created_by_id

=head2 created_date

=head2 description

=head2 owner_id

=head1 ATTRIBUTES

=head2 case

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
