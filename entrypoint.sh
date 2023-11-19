
set -e


rm -f tmp/pids/server.pid
mkdir -p tmp/sockets
mkdir -p tmp/pids


until mysqladmin ping -h $DB_HOST -P 3306 -u root --silent; do
  echo "waiting for mysql..."
  sleep 3s
done
echo "success to connect mysql"


bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:migrate:status
bundle exec rails db:seed

bundle exec rails assets:precompile RAILS_ENV=production


exec "$@"
