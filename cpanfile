requires            "OpenTracing::GlobalTracer";

requires            "Carp";
requires            "Module::Load";

on 'test' => sub {
    requires            "Test::Most";
};
