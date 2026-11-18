#!/usr/bin/env raku

# Raku compiles a script from source on every run, but precompiles modules once
# and reuses them. The transform code lives in lib/TransformResults.rakumod, which
# is precompiled when the image is built, so each run skips about 0.5 s of compiling.
use lib $?FILE.IO.parent.parent.add('lib').absolute;
use TransformResults;

unit sub MAIN (
    Str:D :$test-file,
    Str:D :$tap-results,
    Str:D :$output-file,
);

transform-results(:$test-file, :$tap-results, :$output-file);
