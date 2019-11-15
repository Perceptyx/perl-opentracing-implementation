# # OpenTracing::Implementation

Bootstrap the Implementation for OpenTracing

## SYNOPSIS

```perl
use OpenTracing::Implementation qw/YourBackend/;
```

Or if you like, using `$ENV{OPENTRACING_IMPLEMENTATION}`

```perl
use OpenTracing::Implementation;
```

## DESCRIPTION

This module will bootstrap the OpenTracing infrastructure inside your
application.

Same could be achieved by creating a new Tracer and setting the singleton, like:

```perl
use OpenTracing::Implementation::YourBackend::Tracer;
use OpenTracing::GlobalTracer;

my $my_tracer = OpenTracing::Implementation::YourBackend::Tracer->new( );
OpenTracing::GlobalTracer->set_global_tracer( $my_tracer );
```
