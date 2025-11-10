  Projet DevOps IC Group

  Description du Projet
Déploiement d'une infrastructure DevOps complète pour la société IC Group incluant un site web vitrine, Odoo ERP et pgAdmin.

 Applications Déployées

  Site Vitrine IC Group
- URL : http://localhost:8080
- Technologie : Python/Flask conteneurisé
- Statut : ✅ Production

  Odoo ERP
- URL : http://localhost:8069
- Description : ERP de gestion d'entreprise
- Base de données : PostgreSQL

  pgAdmin
- URL : http://localhost:8890
- Description : Interface d'administration PostgreSQL
- Identifiants : admin@icgroup.com / admin123

  Architecture DevOps

 Partie 1 - Containerisation
- Application web vitrine conteneurisée
- Image Docker : ic-webapp:1.0
- Variables d'environnement : ODOO_URL, PGADMIN_URL

  Partie 2 - CI/CD
- Pipeline Jenkins avec 5 stages
- Rôles Ansible : odoo_role, pgadmin_role
- Fichier releases.txt pour l'automatisation

 Partie 3 - Kubernetes
- Namespace : icgroup
- Label : env=prod
- Manifests complets pour le déploiement

 Technologies Utilisées

- Containerisation : Docker, Docker Compose
- CI/CD : Jenkins, Ansible
- Orchestration : Kubernetes, Minikube
- Applications : Python/Flask, Odoo, pgAdmin, PostgreSQL
- Scripting : PowerShell, Bash

 📁 Structure du Projet

\\\
projet-file-rouge/
├── Dockerfile
├── app.py
├── templates/
├── static/
├── releases.txt
├── Jenkinsfile
├── odoo_role/
├── pgadmin_role/
├── kubernetes-manifests/
├── rapports/
└── README.md
\\\

 Démarrage Rapide

\\\ash
 Cloner le projet
git clone <url-du-repo>

Builder l'image Docker
docker build -t ic-webapp:1.0 .

 Démarrer les services
docker-compose -f docker-compose.prod.yml up -d
\\\

 Résultats

- ✅ 3 applications déployées et fonctionnelles
- ✅ 100% des spécifications respectées
- ✅ Architecture DevOps complète
- ✅ Documentation exhaustive

 Auteur

- Grace Seha

## 📄 Licence

Ce projet est réalisé dans le cadre de la formation DevOps IC Group.

---
*Dernière mise à jour : 2025-11-11*
