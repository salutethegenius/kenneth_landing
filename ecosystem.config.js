module.exports = {
  apps: [{
    name: 'almanakkennethmoncur',
    script: 'npx',
    args: 'http-server _site -p 8080',
    cwd: '/home/ubuntu/apps/almanak',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'production',
      PORT: 8080
    },
    env_production: {
      NODE_ENV: 'production',
      PORT: 8080
    }
  }]
}; 