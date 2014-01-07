requires 'Class::Load';
requires 'Mojo::Base';
requires 'Mojo::JSON';
requires 'Mojo::URL';
requires 'Mojo::UserAgent';

on build => sub {
    requires 'Test::More';
    requires 'Test::Pod';
    requires 'Test::Pod::Coverage';
};

on test => sub {
    requires 'Test::More';
    requires 'Test::Mojo';
};
