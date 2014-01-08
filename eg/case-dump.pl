#!/usr/bin/env perl

use Mojo::Base -strict;
use Net::Salesforce::Client;
use DDP;

my $c = Net::Salesforce::Client->new(access_token => $ENV{SFACCESS_TOKEN});

my $case =
  $c->model('Case')->by_case_number('500i00000014iP0');

p $case->{case};
