FROM ruby:3.1.2-alpine3.15
LABEL "repository"="https://github.com/Loeffelhardt/el-github-tag-action"
LABEL "homepage"="https://github.com/Loeffelhardt/el-github-tag-action"
LABEL "maintainer"="eBiz Löffelhardt"

COPY entrypoint.sh /entrypoint.sh

RUN apk update && apk add bash git curl jq && apk add --update nodejs npm && npm install -g semver

# Added Ruby and gem deps
RUN apk add --no-cache build-base openssl postgresql-dev

ENTRYPOINT ["/entrypoint.sh"]
