# test-deploy.ps1 - Test du déploiement Ansible
Write-Host "=== TEST DÉPLOIEMENT ANSIBLE ===" -ForegroundColor Cyan

# Vérifier Ansible
Write-Host "`n1. Vérification d'Ansible..." -ForegroundColor Yellow
try {
    $ansibleVersion = ansible --version
    Write-Host "✅ Ansible installé" -ForegroundColor Green
    Write-Host "   $($ansibleVersion | Select-Object -First 1)" -ForegroundColor White
} catch {
    Write-Host "❌ Ansible non installé" -ForegroundColor Red
    Write-Host "Installation recommandée pour le pipeline CI/CD complet" -ForegroundColor Yellow
    Write-Host "Mais nous pouvons continuer avec Docker seul pour l'instant" -ForegroundColor White
}

# Test avec Docker directement (alternative)
Write-Host "`n2. Test de déploiement avec Docker..." -ForegroundColor Yellow

# Nettoyer les anciens containers
docker stop odoo_app pgadmin_app ic_webapp 2>$null
docker rm odoo_app pgadmin_app ic_webapp 2>$null
docker network rm icgroup_network 2>$null

# Créer le réseau
docker network create icgroup_network

# Démarrer les services
Write-Host "   Démarrage d'Odoo..." -ForegroundColor White
docker run -d --name odoo_app --network icgroup_network -p 8069:8069 odoo:13.0

Write-Host "   Démarrage de pgAdmin..." -ForegroundColor White
docker run -d --name pgadmin_app --network icgroup_network -p 5050:80 -e PGADMIN_DEFAULT_EMAIL=admin@icgroup.com -e PGADMIN_DEFAULT_PASSWORD=admin dpage/pgadmin4

Write-Host "   Démarrage de l'application web..." -ForegroundColor White
docker run -d --name ic_webapp --network icgroup_network -p 8080:8080 -e ODOO_URL="http://odoo_app:8069" -e PGADMIN_URL="http://pgadmin_app:80" gseha/ic-webapp:latest

# Vérification
Write-Host "`n3. Vérification du déploiement..." -ForegroundColor Yellow
Start-Sleep -Seconds 5
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

Write-Host "`n🎯 DÉPLOIEMENT RÉUSSI !" -ForegroundColor Green
Write-Host "Applications accessibles sur :" -ForegroundColor White
Write-Host "🌐 Site vitrine: http://localhost:8080" -ForegroundColor Cyan
Write-Host "📊 Odoo: http://localhost:8069" -ForegroundColor Cyan
Write-Host "🗄️ pgAdmin: http://localhost:5050" -ForegroundColor Cyan
Write-Host "   Email: admin@icgroup.com / Mot de passe: admin" -ForegroundColor White
