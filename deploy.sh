#!/bin/bash

# AWS Deployment Script for Kenneth Moncur's Almanac
# This script sets up the server and deploys the site with PM2

echo "🚀 Starting AWS deployment for Kenneth Moncur's Almanac..."

# Update system packages
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Node.js and npm (if not already installed)
if ! command -v node &> /dev/null; then
    echo "📥 Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Install PM2 globally
echo "📥 Installing PM2..."
sudo npm install -g pm2

# Create application directory
echo "📁 Setting up application directory..."
sudo mkdir -p /home/ubuntu/almanakkennethmoncur
sudo chown ubuntu:ubuntu /home/ubuntu/almanakkennethmoncur

# Copy application files (assuming you're running this from the project directory)
echo "📋 Copying application files..."
cp -r . /home/ubuntu/almanakkennethmoncur/

# Navigate to application directory
cd /home/ubuntu/almanakkennethmoncur

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Build the site
echo "🔨 Building the site..."
npm run build

# Start the application with PM2
echo "🚀 Starting application with PM2..."
pm2 start ecosystem.config.js --env production

# Save PM2 configuration for auto-start
echo "💾 Saving PM2 configuration..."
pm2 save

# Setup PM2 to start on system boot
echo "🔧 Setting up PM2 startup script..."
pm2 startup

# Install nginx for reverse proxy (optional but recommended)
echo "📥 Installing nginx..."
sudo apt install -y nginx

# Create nginx configuration
echo "⚙️ Creating nginx configuration..."
sudo tee /etc/nginx/sites-available/almanakkennethmoncur << EOF
server {
    listen 80;
    server_name your-domain.com;  # Replace with your actual domain

    location / {
        proxy_pass http://localhost:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Enable the site
sudo ln -sf /etc/nginx/sites-available/almanakkennethmoncur /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

# Test nginx configuration
sudo nginx -t

# Restart nginx
sudo systemctl restart nginx

# Enable nginx to start on boot
sudo systemctl enable nginx

echo "✅ Deployment completed successfully!"
echo "🌐 Your site should now be accessible at http://your-domain.com"
echo "📊 PM2 status: pm2 status"
echo "📝 PM2 logs: pm2 logs almanakkennethmoncur" 