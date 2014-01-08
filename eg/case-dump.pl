#!/usr/bin/env perl

use Mojo::Base -strict;
use Net::Salesforce;
use Net::Salesforce::Client;
use DDP;

my $sf = Net::Salesforce->new(
    key          => $ENV{SFKEY},
    secret       => $ENV{SFSECRET},
    callback_uri => 'https://localhost:8081/callback'
);

my $access_token = $sf->refresh($ENV{SFREFRESH_TOKEN})->{access_token};

my $c = Net::Salesforce::Client->new(access_token => $access_token);

p $c->sobjects;

my $case =
  $c->model('Case')->by_case_number('500i00000014iP0');

p $case->{case};
