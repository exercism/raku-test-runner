FROM rakudo-star:2026.09-alpine

RUN apk add --no-cache bash jq coreutils nodejs npm

RUN npm install -g tap-parser

WORKDIR /opt/test-runner
COPY . .

# Precompile lib/TransformResults.rakumod, so runs load it instead of compiling it.
# HOME is set as in bin/run.sh, because Raku stores the module search path with
# the precompiled file and rechecks (and rewrites) it on load if the path differs.
RUN HOME=/tmp raku -c bin/transform-results.raku && rm -rf /tmp/.raku

ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
