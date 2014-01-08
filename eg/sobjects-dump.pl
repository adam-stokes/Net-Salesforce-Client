#!/usr/bin/env perl

use Mojo::Base -strict;
use Net::Salesforce::Client;
use DDP;

my $c = Net::Salesforce::Client->new(access_token => $ENV{SFACCESS_TOKEN});

p $c->sobjects;
