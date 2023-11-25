#!/bin/sh
set -e

rm -f tmp/pids/unicorn.pid
mkdir -p tmp/sockets
mkdir -p tmp/pids

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:migrate:status
bundle exec rails db:seed

exec "$@"
