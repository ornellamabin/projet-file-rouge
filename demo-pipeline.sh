#!/bin/bash
echo "=== DÉMONSTRATION DU PIPELINE CI/CD IC GROUP ==="
echo "Ce script simule le pipeline Jenkins complet"

echo "1. EXTRACTION DE LA VERSION"
version=
odoo_url=
pgadmin_url=

echo "Version: \"
echo "Odoo URL: \"
echo "PgAdmin URL: \"

echo "2. CONSTRUCTION DE L'IMAGE"
docker build -t gseha/ic-webapp:\ .

echo "3. TESTS AUTOMATISÉS"
docker run -d --name test-app -p 8081:8080 gseha/ic-webapp:\
sleep 10
curl -f http://localhost:8081 && echo "Tests réussis" || echo "Tests échoués"
docker stop test-app && docker rm test-app

echo "4. DÉPLOIEMENT AVEC ANSIBLE"
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml --extra-vars "version=\"

echo "5. VALIDATION"
echo "Applications déployées:"
echo "- Odoo: http://localhost:8069"
echo "- PgAdmin: http://localhost:8888"
echo "- Portail: Déployé sur Kubernetes"

echo "=== PIPELINE TERMINÉ AVEC SUCCÈS ==="
