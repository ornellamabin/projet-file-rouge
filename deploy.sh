#!/bin/bash
echo '🚀 Deploying IC GROUP Infrastructure...'

# Stop existing containers
echo 'Stopping existing containers...'
docker-compose -f docker-compose-full.yml down

# Pull latest images
echo 'Pulling latest images...'
docker pull gseha/ic-webapp:1.1

# Deploy
echo 'Starting services...'
docker-compose -f docker-compose-full.yml up -d

# Wait for services to be ready
echo 'Waiting for services to start...'
sleep 30

# Health checks
echo 'Running health checks...'

# Check Web Portal
if curl -f http://localhost:8080 > /dev/null 2>&1; then
    echo '✅ Web Portal is running'
else
    echo '❌ Web Portal failed'
    exit 1
fi

# Check Odoo
if curl -f http://localhost:8069 > /dev/null 2>&1; then
    echo '✅ Odoo is running'
else
    echo '❌ Odoo failed'
    exit 1
fi

# Check pgAdmin
if curl -f http://localhost:8888 > /dev/null 2>&1; then
    echo '✅ pgAdmin is running'
else
    echo '❌ pgAdmin failed'
    exit 1
fi

echo '🎉 Deployment completed successfully!'
echo ''
echo '🌐 Access your applications:'
echo '   Site Vitrine: http://localhost:8080'
echo '   Odoo ERP:     http://localhost:8069'
echo '   pgAdmin:      http://localhost:8888'
