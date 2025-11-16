# Script Git pour le projet DevOps IC Group
# Usage: .\deploy-to-git.ps1 "message de commit"

param(
    [string]\ = "Mise à jour du projet"
)

Write-Host "🚀 Déploiement sur Git..." -ForegroundColor Green

# Vérifier le statut
git status

# Ajouter tous les fichiers
git add .

# Faire le commit
git commit -m "\"

# Pousser vers le repository distant
git push origin main

Write-Host "✅ Déploiement terminé!" -ForegroundColor Green
