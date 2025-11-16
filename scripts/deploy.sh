#!/bin/bash
echo "🚀 Déploiement IC GROUP - Docker Compose"
echo "========================================"

echo "1. Arrêt des services existants..."
docker-compose -f docker-compose/docker-compose.full-app.yml down

echo "2. Lancement de l'\''application complète..."
docker-compose -f docker-compose/docker-compose.full-app.yml up -d

echo "3. Attente du démarrage..."
sleep 30

echo "4. Vérification des conteneurs..."
docker ps

echo ""
echo "✅ Déploiement terminé avec succès!"
echo ""
echo "🌐 URLs d'\''accès:"
echo "   - Site vitrine IC GROUP: http://localhost:8080"
echo "   - Odoo ERP: http://localhost:8069"
echo "   - pgAdmin: http://localhost:8888"
echo "   - Adminer: http://localhost:8088"
echo ""
echo "🔑 Identifiants:"
echo "   - pgAdmin: admin@icgroup.com / admin123"
echo "   - PostgreSQL: odoo / odoo123"
echo ""
