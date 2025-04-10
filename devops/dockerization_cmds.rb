cd code
cd myApp/
Step 1: Create a Dockerfile
Create a Dockerfile in your project root:
# Dockerfile

# FROM ruby:3.3.2

# # Install dependencies
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# # Set working directory
# WORKDIR /app

# # Install gems
# COPY Gemfile Gemfile.lock ./
# RUN bundle install

# # Add the app code
# COPY . .

# # Add bin to PATH and set entrypoint
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

# EXPOSE 3000

# CMD ["rails", "server", "-b", "0.0.0.0"]

Step 2: Create docker-compose.yml
# version: '3.8'

# services:
#   web:
#     build: .
#     command: bash -c "rm -f tmp/pids/server.pid && bundle install && rails server -b 0.0.0.0 -p 3000"
#     volumes:
#       - .:/app
#     ports:
#       - "3000:3000"
#     depends_on:
#       - db
#     environment:
#       DATABASE_USERNAME: postgres
#       DATABASE_PASSWORD: postgres
#       DATABASE_HOST: db

#   db:
#     image: postgres:14
#     environment:
#       POSTGRES_USER: postgres
#       POSTGRES_PASSWORD: postgres
#     volumes:
#       - postgres_data:/var/lib/postgresql/data
#     ports:
#       - "5432:5432"

# volumes:
#   postgres_data:


Step 3: Create entrypoint.sh and Make it executable:
chmod +x entrypoint.sh

Step : Update config/database.yml
# default: &default
#   adapter: postgresql
#   encoding: unicode
#   username: <%= ENV["DATABASE_USERNAME"] || "postgres" %>
#   password: <%= ENV["DATABASE_PASSWORD"] || "postgres" %>
#   host: <%= ENV["DATABASE_HOST"] || "db" %>
#   pool: 5

# development:
#   <<: *default
#   database: myapp_dev

# test:
#   <<: *default
#   database: myapp_test

#Docker setup
docker-compose build
docker-compose up -d
docker-compose run web rails db:create db:migrate db:seed

# if any changes made
docker-compose down
docker-compose build
docker-compose up -d
docker-compose run web rails db:create db:migrate

docker-compose run web rails db:seed
docker-compose run web rails db:reset
docker-compose run web bundle exec rspec


#To run server
docker-compose up
# to debug while the rails server is running
docker ps
docker attach myapp-web-1(provide the name)


docker images

docker-compose exec web rails console
