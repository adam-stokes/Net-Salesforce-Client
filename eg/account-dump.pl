#!/usr/bin/env perl

use Mojo::Base -strict;
use Net::Salesforce;
use Net::Salesforce::Client;
use DDP;

my $api_host = 'https://cs7.salesforce.com/';

# Authenticate and grab a access_token
my $sf = Net::Salesforce->new(
    'key'          => $ENV{SFKEY},
    'secret'       => $ENV{SFSECRET},
    'redirect_uri' => 'https://localhost:8081/callback',
    'api_host'      => $api_host,
);

my $access_token = $sf->refresh($ENV{SFREFRESH_TOKEN})->{access_token};

p $access_token;

my $c = Net::Salesforce::Client->new('access_token' => $access_token, 'api_host' => $api_host);

my $tx =
  $c->model('Account')->by_account_number($ENV{CUS_ACCOUNT_NUMBER});

p $tx->name;
p $tx->created_date;
