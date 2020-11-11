#!/bin/bash
sudo service nginx start

bundle exec pumactl start

set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails-fargate/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
