FROM rakudo-star:2025.02-alpine

RUN apk add --no-cache bash jq coreutils nodejs npm

RUN npm install -g tap-parser

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
