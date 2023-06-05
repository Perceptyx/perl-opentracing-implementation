requires            "OpenTracing::GlobalTracer";
requires            "Carp";
requires            "Module::Load";
requires            "Role::Declare::Should";
requires            "Types::Standard";

recommends          "OpenTracing::Implementation::NoOp";



on 'develop' => sub {
    requires            "ExtUtils::MakeMaker::CPANfile";
};



on 'test' => sub {
    requires            "OpenTracing::Interface::Tracer";
    requires            "OpenTracing::Implementation::NoOp";
    requires            "Role::Tiny::With";
    requires            "Test::Most";
    requires            "Module::Loaded";
};
