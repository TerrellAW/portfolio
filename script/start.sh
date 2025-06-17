#!/bin/bash

# Always update system packages
sudo apt update && sudo apt upgrade -y

# Enter the directory
cd /home/ubuntu/portfolio || exit 1

# Pull latest changes from remote repository
git pull origin main

# Only update gems if Gemfile changed
if [ Gemfile -nt Gemfile.lock ]; then
    bundle install --deployment
fi

# Run database migrations
rails db:migrate
rails db:seed

# Start the Rails server
rails server -b 0.0.0.0 -p 3000 -e production
