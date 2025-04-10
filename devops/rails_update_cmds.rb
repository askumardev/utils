echo "3.3.2" > .ruby-version
in gemfile:
  gem "rails", "7.2.0.beta3"
bundle update rails
bundle outdated
rails app:update
rails s
in gemfile:
  gem "puma", ">= 6.0"
bundle update puma
rails s
bundle exec rails c
# setting the db using psql

sudo -i -u postgres
#[sudo] password for user: "r--t"

psql
# Then run:
postgres=# CREATE USER your_db_user WITH PASSWORD 'your_db_password';
#postgres=# ALTER ROLE your_db_user CREATEDB;
#(we use rails db:create . so not necessary)

rails db:create && rails db:migrate
rails db:seed
# to run specs
bundle exec rspec
rails db:drop db:create db:migrate
rails db:seed
bundle exec rspec
rails s
