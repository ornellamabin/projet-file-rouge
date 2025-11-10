# install-jenkins.ps1
Write-Host "=== INSTALLATION JENKINS ===" -ForegroundColor Cyan

docker stop jenkins 2>$null
docker rm jenkins 2>$null
docker stop ic_webapp 2>$null
docker rm ic_webapp 2>$null

Write-Host "Démarrage de Jenkins..." -ForegroundColor Yellow
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts-jdk11

Write-Host "Attente 30 secondes..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

$jenkinsLogs = docker logs jenkins 2>&1
$passwordLine = $jenkinsLogs -split "`n" | Where-Object { $_ -match "password" } | Select-Object -First 1

if ($passwordLine) {
    $initialPassword = $passwordLine -replace '.*: ', ''
    Write-Host "🔑 MOT DE PASSE JENKINS: $initialPassword" -ForegroundColor Red -BackgroundColor White
}

docker ps -f name=jenkins --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

Write-Host "🎯 Accédez à: http://localhost:8080" -ForegroundColor Green
