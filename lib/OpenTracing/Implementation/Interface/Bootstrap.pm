package OpenTracing::Implementation::Interface::Bootstrap;

use Role::Declare::Should;
use Types::Standard qw/Any ConsumerOf Maybe Str/;



class_method bootstrap_tracer(
    Str $implementation_name,
    Maybe [ Any ] @implementation_args,
) :Return ( ConsumerOf['OpenTracing::Interface::Tracer'] ) { }



1;