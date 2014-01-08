#!/usr/bin/env perl

use Mojo::Base -strict;
use Net::Salesforce::Client;
use DDP;

p $ENV{SFACCESS_TOKEN};
my $c = Net::Salesforce::Client->new(access_token => $ENV{SFACCESS_TOKEN});
p $c;

my $account =
  $c->model('Account')->by_account_number($ENV{CUS_ACCOUNT_NUMBER});

p $account;
