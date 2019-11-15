package OpenTracing::Implementation;

use strict;
use warnings;

=head1 NAME

OpenTracing::Implementation - Use OpenTracing with a specific implementation

=head1 SYNOPSIS

    use OpenTracing::Implementation qw/YourBackend/;

Or if you like

    use OpenTracing::Implementation;
    
    

=cut

#use lib qw(/Users/tvanhoesel/Repositories/Perceptyx/perl-opentracing-implementation-datadog/lib);

use Carp;

use OpenTracing::GlobalTracer qw/$TRACER/;


use Module::Load;

sub import {
    my $package = shift;
    my $implementation_name = shift || $ENV{OPENTRACING_IMPLEMENTATION}
        or return;
    my @implementation_args = @_;
    
    __PACKAGE__->set( $implementation_name, @implementation_args )
}



sub set {
    my $package = shift;
    my $implementation_name = shift;
    my @implementation_args = @_;
    
    my $implementation_class =
        __PACKAGE__->_get_implementation_class( $implementation_name );
    
    carp "Loading implementation $implementation_class"
        if $ENV{OPENTRACING_DEBUG};
    
    load $implementation_class;
    
    $TRACER = $implementation_class->bootstrap( @implementation_args);
    
    return $TRACER
}



sub _get_implementation_class {
    my $class = shift;
    my $implementation_name = shift;
    
    my $implementation_class = substr( $implementation_name, 0, 1) eq '+' ?
        substr( $implementation_name, 1 )
        :
        'OpenTracing::Implementation::' . $implementation_name;
    
    return $implementation_class
}



1;
