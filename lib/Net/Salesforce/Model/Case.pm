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

sub subject {
    my $self = shift;
    return $self->case->{Subject};
}

sub description {
    my $self = shift;
    return $self->case->{Description};
}

sub status {
    my $self = shift;
    return $self->case->{Status};
}

sub priority {
    my $self = shift;
    return $self->case->{Priority};
}

sub account_id {
    my $self = shift;
    return $self->case->{AccountId};
}

sub asset_id {
    my $self = shift;
    return $self->case->{AssetId};
}

sub created_date {
    my $self = shift;
    return $self->case->{CreatedDate};
}

sub created_by_id {
    my $self = shift;
    return $self->case->{CreatedById};
}

sub is_closed {
    my $self = shift;
    return $self->case->{IsClosed};
}

sub is_escalated {
    my $self = shift;
    return $self->case->{IsEscalated};
}

sub last_modified {
    my $self = shift;
    return $self->case->{LastModifiedDate};
}

sub type {
    my $self = shift;
    return $self->case->{Type};
}

sub owner_id {
    my $self = shift;
    return $self->case->{OwnerId};
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

=head2 account_id

=head2 asset_id

=head2 created_by_id

=head2 created_date

=head2 description

=head2 is_closed

=head2 is_escalated

=head2 last_modified

=head2 owner_id

=head2 priority

=head2 status

=head2 subject

=head2 type

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
