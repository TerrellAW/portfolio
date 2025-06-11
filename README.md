# Rails Application Deployment Guide

This guide walks through setting up and running this Rails application on a fresh Ubuntu Server system using Docker.

## Prerequisites

- Ubuntu Server 24.04 (or similar Linux distribution)
- Docker installed
- Git installed
- SSH access to GitHub configured

## System Setup

### 1. Install Required Packages
```bash
sudo apt update
sudo apt install docker.io git
```

### 2. Configure Docker
```bash
# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to docker group (avoids needing sudo)
sudo usermod -aG docker $USER

# Log out and back in for group changes to take effect
```

### 3. Verify Docker Installation
```bash
docker --version
docker run hello-world
```

## GitHub SSH Setup

### 1. Generate SSH Key
```bash
ssh-keygen -t ed25519 -C "your-email@example.com"
```

### 2. Add SSH Key to GitHub
```bash
# Display your public key
cat ~/.ssh/id_ed25519.pub
```
Copy this key and add it to your GitHub repository under Settings > Deploy keys.

Do not check box for Readonly deployments.

### 3. Test GitHub Connection
```bash
ssh -T git@github.com
```

## Application Setup

### 1. Clone Repository
```bash
git clone git@github.com:username/your-rails-repo.git
cd your-rails-repo
```

### 2. Start Rails Container
```bash
docker run -it -v $(pwd):/app -p 3000:3000 -w /app ruby:3.4 bash
```

### 3. Inside the Container - Install Dependencies
```bash
# Install bundler if not present
gem install bundler

# Install Rails dependencies
bundle install
```

### 4. Database Setup
```bash
# Create database
rails db:create

# Run migrations
rails db:migrate

# Seed database (if you have seed data)
rails db:seed
```

### 5. Start the Rails Server
```bash
rails server -b 0.0.0.0
```

The application should now be accessible at `http://your-server-ip:3000`

## Common Database Commands

### Reset Database
```bash
rails db:drop
rails db:create
rails db:migrate
rails db:seed
```

### Run Specific Migration
```bash
rails db:migrate:up VERSION=20231201000000
```

### Check Migration Status
```bash
rails db:migrate:status
```

### Generate New Migration
```bash
rails generate migration AddColumnToTable column_name:data_type
```

## Updating the Application

### 1. Pull Latest Code (on host system)
```bash
cd your-rails-repo
git pull origin main
```

### 2. Restart Container
Exit the current container and start a new one:
```bash
# Exit container
exit

# Start new container
docker run -it -v $(pwd):/app -p 3000:3000 -w /app ruby:3.4 bash

# Inside new container
bundle install
rails db:migrate
rails server -b 0.0.0.0
```

## Production Considerations

### Using Docker Compose (Recommended for multiple services)
Create a `docker-compose.yml` file:
```yaml
version: '3.8'
services:
  web:
    image: ruby:3.4
    command: bash -c "bundle install && rails server -b 0.0.0.0"
    volumes:
      - .:/app
    working_dir: /app
    ports:
      - "3000:3000"
    depends_on:
      - db

  db:
    image: postgres:15
    environment:
      POSTGRES_DB: myapp_production
      POSTGRES_USER: myapp
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

Then run:
```bash
docker-compose up
```

### Environment Variables
For production, set these environment variables:
```bash
export RAILS_ENV=production
export SECRET_KEY_BASE=your-secret-key
export DATABASE_URL=your-database-url
```

### SSL/HTTPS Setup
Use nginx as a reverse proxy with Let's Encrypt:
```bash
sudo apt install nginx certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com
```

## Troubleshooting

### Container Won't Start
- Check if port 3000 is already in use: `sudo lsof -i :3000`
- Verify Docker is running: `sudo systemctl status docker`

### Database Connection Issues
- Ensure database is created: `rails db:create`
- Check database configuration in `config/database.yml`
- Verify database service is running if using external database

### Permission Issues
- Ensure you're in the docker group: `groups`
- Check file permissions in mounted volume
- Try running with `sudo` temporarily to test

### Bundle Install Fails
- Clear bundle cache: `bundle clean --force`
- Delete Gemfile.lock and run `bundle install` again
- Check Ruby version compatibility

## Notes

- The `-b 0.0.0.0` flag in `rails server` is required for Docker containers to accept external connections
- Always run database migrations after pulling code updates
- Keep your `config/database.yml` and other sensitive files out of version control
- Consider using Docker Compose for managing multiple services (database, redis, etc.)
