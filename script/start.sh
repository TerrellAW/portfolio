#!/bin/bash

# Always update system packages
sudo apt update && sudo apt upgrade -y

# Enter the directory
cd /home/ubuntu/portfolio || exit 1

# Pull latest changes from remote repository
git pull origin main

# Run docker instance
docker run -it -v $(pwd):/app -p 3000:3000 -w /app \
    -e SECRET_KEY_BASE=$(openssl rand -hex 64) \
    ruby:3.4.3 bash -c "

        # Install and update dependencies
        gem install bundler
        bundle install

        # Run database setup
        rails db:create
        rails db:migrate
        rails db:seed

        # Start the Rails server
        rails server -b 0.0.0.0 -p 3000 -e production
"
