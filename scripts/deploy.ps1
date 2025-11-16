Write-Host "🚀 Déploiement IC GROUP - 5 Services Complets" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green

try {
    Write-Host "1. Arrêt des services existants..." -ForegroundColor Yellow
    docker-compose -f docker-compose/docker-compose.full-app.yml down
    
    Write-Host "2. Lancement des 5 services..." -ForegroundColor Yellow
    docker-compose -f docker-compose/docker-compose.full-app.yml up -d
    
    Write-Host "3. Attente du démarrage (60 secondes)..." -ForegroundColor Yellow
    Start-Sleep -Seconds 60
    
    Write-Host "4. Vérification des conteneurs..." -ForegroundColor Yellow
    docker ps
    
    Write-Host ""
    Write-Host "✅ Déploiement terminé avec succès!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🌐 URLs d''accès:" -ForegroundColor Cyan
    Write-Host "   - Site vitrine IC GROUP: http://localhost:8080"
    Write-Host "   - Odoo ERP: http://localhost:8069" 
    Write-Host "   - pgAdmin: http://localhost:8888"
    Write-Host "   - Adminer: http://localhost:8088"
    Write-Host ""
    Write-Host "🔑 Identifiants Adminer:" -ForegroundColor White
    Write-Host "   - System: PostgreSQL"
    Write-Host "   - Server: postgres-odoo" 
    Write-Host "   - Username: odoo"
    Write-Host "   - Password: odoo123"
    Write-Host "   - Database: postgres"
    Write-Host ""
    Write-Host "🔑 Identifiants pgAdmin:" -ForegroundColor White
    Write-Host "   - Email: admin@icgroup.com"
    Write-Host "   - Password: admin123"
    Write-Host ""
} catch {
    Write-Host "❌ Erreur lors du déploiement: $_" -ForegroundColor Red
}
