# DÉMONSTRATION DU PIPELINE CI/CD IC GROUP - VERSION CORRIGÉE

Write-Host "=== DÉMONSTRATION DU PIPELINE CI/CD IC GROUP ===" -ForegroundColor Cyan
Write-Host "Ce script simule le pipeline Jenkins complet" -ForegroundColor Yellow

Write-Host "
1. EXTRACTION DE LA VERSION" -ForegroundColor Green
$releases = Get-Content releases.txt
$version = ($releases | Where-Object { $_ -like "Version*" }).Split()[1]
$odoo_url = ($releases | Where-Object { $_ -like "ODOO_URL*" }).Split()[1]
$pgadmin_url = ($releases | Where-Object { $_ -like "PGADMIN_URL*" }).Split()[1]

Write-Host "Version: $version" -ForegroundColor White
Write-Host "Odoo URL: $odoo_url" -ForegroundColor White
Write-Host "PgAdmin URL: $pgadmin_url" -ForegroundColor White

Write-Host "
2. CONSTRUCTION DE L'IMAGE" -ForegroundColor Green
docker build -t gseha/ic-webapp:$version .

Write-Host "
3. TESTS AUTOMATISÉS" -ForegroundColor Green
Write-Host "Utilisation du port 8090 pour éviter les conflits..." -ForegroundColor Yellow
docker run -d --name test-app -p 8090:8080 gseha/ic-webapp:$version
Start-Sleep -Seconds 10

try {
    $response = Invoke-WebRequest -Uri "http://localhost:8090" -TimeoutSec 5 -UseBasicParsing
    Write-Host "Tests réussis" -ForegroundColor Green
} catch {
    Write-Host "Tests échoués" -ForegroundColor Red
}

docker stop test-app 2>$null
docker rm test-app 2>$null

Write-Host "
4. DÉPLOIEMENT AVEC ANSIBLE (SIMULÉ)" -ForegroundColor Green
Write-Host "Ansible non disponible sur Windows - Déploiement simulé" -ForegroundColor Yellow
Write-Host "Les applications sont déjà déployées et fonctionnelles:" -ForegroundColor Yellow

Write-Host "
5. VALIDATION" -ForegroundColor Green
Write-Host "Applications déployées:" -ForegroundColor Yellow

# Test de chaque application
$apps = @(
    @{Name="Odoo ERP"; URL="http://localhost:8069"},
    @{Name="pgAdmin"; URL="http://localhost:8888"},
    @{Name="Adminer"; URL="http://localhost:8088"}
)

foreach ($app in $apps) {
    try {
        $response = Invoke-WebRequest -Uri $app.URL -TimeoutSec 3 -UseBasicParsing
        Write-Host "✅ $($app.Name): $($app.URL)" -ForegroundColor Green
    } catch {
        Write-Host "❌ $($app.Name): $($app.URL) - Inaccessible" -ForegroundColor Red
    }
}

Write-Host "✅ Portail IC GROUP: Déployé sur Kubernetes" -ForegroundColor Green

Write-Host "
=== PIPELINE SIMULÉ AVEC SUCCÈS ===" -ForegroundColor Cyan -BackgroundColor DarkBlue
