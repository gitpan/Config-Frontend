package Config::Frontend;

use 5.006;
use strict;

our $VERSION = '0.11';

sub new {
  my $class=shift;
  my $backend=shift;
  my $self;

  $self->{"backend"}=$backend;
  bless $self,$class;

return $self;
}

sub set {
  my ($self,$var,$val)=@_;
  $self->{"backend"}->set($var,$val);
}

sub get {
  my ($self,$var)=@_;
return $self->{"backend"}->get($var);
}

sub del {
  my ($self,$var)=@_;
  $self->{"backend"}->del($var);
}

sub variables {
  my $self=shift;
  return $self->{"backend"}->variables();
}

1;
__END__

=head1 NAME

Config::Frontend - Configuration module with flexible backends

=head1 SYNOPSIS

 use Config::Frontend;
 use Config::Frontend::String;
 
 open my $in,"<conf.cfg";
 my $string=<$in>;
 close $in;

 my $cfg=new Conf(new Config::Frontend::String(\$string))

 print $cfg->get("config item 1");
 $cfg->set("config item 1","Hi There!");

 $cfg->set("cfg2","config 2");

 $cfg->del("config item 1");

 open my $out,">conf.cfg";
 print $out $string;
 close $out;

=head1 ABSTRACT

This module can be used to put configuration items in.
It's build up by using a backend and an interface. The
interface is through the C<Config::Frontend> module. A 
C<Config::Frontend> object is instantiated with a backend.

=head1 DESCRIPTION

=head2 C<new(backend) --E<gt> Conf>

Should be called with a pre-instantiated backend.
Returns a C<Config::Frontend> object.

=head2 C<set(var,val) --E<gt> void>

Sets a variable with value val in the backend.

=head2 C<get(var) --E<gt> string>

Returns the value for var as stored in the backend.
Returns C<undef>, if var does not exist in the backend.

=head2 C<del(var) --E<gt> void>

Deletes a variable from the backend.

=head2 C<variables() --E<gt> list of stored variables>

Returns a list all variables stored in the backen.

=head1 SEE ALSO

L<Config::Backend::String|Config::Backend::String>, 
L<Config::Backend::SQL|Config::Backend::SQL>, 
L<Config::Backend::File|Config::Backend::File>,
L<Config::Backend::INI|Config::Backend::INI>.

=head1 AUTHOR

Hans Oesterholt-Dijkema, E<lt>oesterhol@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2004 by Hans Oesterholt-Dijkema

This library is free software; you can redistribute it and/or modify
it under LGPL. 

=cut
