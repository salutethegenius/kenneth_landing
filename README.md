# Kenneth Moncur's Almanac

A personal knowledge base and digital library built with Eleventy, featuring island wisdom, books, and Bahamian vibes.

## 🚀 AWS Deployment with PM2

This project is configured for automatic deployment to AWS with PM2 process management.

### Prerequisites

- AWS EC2 instance (Ubuntu recommended)
- Domain name (optional but recommended)
- SSH access to your server

### Quick Deployment

1. **Upload your project to AWS:**
   ```bash
   # From your local machine
   scp -r . ubuntu@your-aws-ip:/home/ubuntu/
   ```

2. **SSH into your AWS server:**
   ```bash
   ssh ubuntu@your-aws-ip
   ```

3. **Run the deployment script:**
   ```bash
   cd /home/ubuntu/almanakkennethmoncur
   chmod +x deploy.sh
   ./deploy.sh
   ```

### Manual Deployment Steps

If you prefer to deploy manually:

1. **Install Node.js and PM2:**
   ```bash
   curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
   sudo apt-get install -y nodejs
   sudo npm install -g pm2
   ```

2. **Install dependencies and build:**
   ```bash
   npm install
   npm run build
   ```

3. **Start with PM2:**
   ```bash
   pm2 start ecosystem.config.js --env production
   pm2 save
   pm2 startup
   ```

### PM2 Management Commands

- **Check status:** `pm2 status`
- **View logs:** `pm2 logs almanakkennethmoncur`
- **Restart app:** `pm2 restart almanakkennethmoncur`
- **Stop app:** `pm2 stop almanakkennethmoncur`
- **Delete app:** `pm2 delete almanakkennethmoncur`

### Configuration Files

- `ecosystem.config.js` - PM2 configuration
- `deploy.sh` - Automated deployment script
- `package.json` - Project dependencies and scripts

### Security Considerations

1. **Update the nginx configuration** in `deploy.sh` with your actual domain
2. **Configure SSL** with Let's Encrypt for HTTPS
3. **Set up firewall rules** to only allow necessary ports
4. **Regular security updates** for your server

### Troubleshooting

- **Port conflicts:** Check if port 8080 is available
- **Permission issues:** Ensure proper file ownership
- **Build errors:** Check Node.js version compatibility
- **PM2 issues:** Use `pm2 logs` for detailed error messages

## Local Development

```bash
npm install
npm run dev
```

Visit `http://localhost:8080` to see your site.

## Project Structure

```
almanakkennethmoncur/
├── src/                    # Source files
│   ├── books/             # Book content
│   ├── frameworks/        # Framework documents
│   └── pages/            # Additional pages
├── _site/                 # Built site (generated)
├── ecosystem.config.js    # PM2 configuration
├── deploy.sh             # Deployment script
└── package.json          # Dependencies
```

## 🌴 Island Wisdom

Built with island spirit and Bahamian vibes. Keep it simple, keep it real. 