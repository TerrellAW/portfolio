#!/bin/bash

# Always update system packages
sudo apt update && sudo apt upgrade -y

# Enter the directory
cd ~/portfolio || exit 1

# Run ssh agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Pull latest changes from remote repository
git pull origin main

# Stop and remove existing container if it exists
docker stop portfolio-app 2>/dev/null || true
docker rm portfolio-app 2>/dev/null || true

# Run docker instance
docker run -it \
    --name portfolio-app \
    --restart unless-stopped \
    -v $(pwd):/app \
    -p 3000:3000 \
    -w /app \
    ruby:3.4.3 bash -i -c "
        # Install and update dependencies
        gem install bundler
        bundle install
        # Run database setup
        rails db:create RAILS_ENV=production
        rails db:migrate RAILS_ENV=production
        rails db:seed RAILS_ENV=production
        rails assets:precompile RAILS_ENV=production
        # Start the Rails server
        rails server -b 0.0.0.0 -p 3000 -e production
   "

# Show container status
docker ps
