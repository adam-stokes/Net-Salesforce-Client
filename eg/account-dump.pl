#!/usr/bin/env perl

use Mojo::Base -strict;
use Net::Salesforce;
use Net::Salesforce::Client;
use DDP;

# Authenticate and grab a access_token
my $sf = Net::Salesforce->new(
    'key'          => $ENV{SFKEY},
    'secret'       => $ENV{SFSECRET},
    'redirect_uri' => 'https://localhost:8081/callback'
);

my $access_token = $sf->refresh($ENV{SFREFRESH_TOKEN})->{access_token};

my $c = Net::Salesforce::Client->new('access_token' => $access_token);

my $account =
  $c->model('Account')->by_account_number($ENV{CUS_ACCOUNT_NUMBER});

p $account;
