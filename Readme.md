<<<<<<< HEAD
﻿🏆 Projet DevOps IC Group

📋 Description du Projet
Déploiement d'une infrastructure DevOps complète pour la société IC Group incluant un site web vitrine, Odoo ERP et pgAdmin.

 🚀 Applications Déployées

🌐 Site Vitrine IC Group
=======
﻿  Projet DevOps IC Group

  Description du Projet
Déploiement d'une infrastructure DevOps complète pour la société IC Group incluant un site web vitrine, Odoo ERP et pgAdmin.

 Applications Déployées

  Site Vitrine IC Group
>>>>>>> 8e72effd1b2a0355534f9f7b01bcefece82c7f27
- URL : http://localhost:8080
- Technologie : Python/Flask conteneurisé
- Statut : ✅ Production

<<<<<<< HEAD
 🏢 Odoo ERP
- URL: http://localhost:8069
- Description : ERP de gestion d'entreprise
- Base de données: PostgreSQL

 📊 pgAdmin
- URL: http://localhost:8890
- Description : Interface d'administration PostgreSQL
- Identifiants : admin@icgroup.com / admin123

 🏗️ Architecture DevOps

 📦 Partie 1 - Containerisation
=======
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
>>>>>>> 8e72effd1b2a0355534f9f7b01bcefece82c7f27
- Application web vitrine conteneurisée
- Image Docker : ic-webapp:1.0
- Variables d'environnement : ODOO_URL, PGADMIN_URL

<<<<<<< HEAD
 ⚙️ Partie 2 - CI/CD
=======
  Partie 2 - CI/CD
>>>>>>> 8e72effd1b2a0355534f9f7b01bcefece82c7f27
- Pipeline Jenkins avec 5 stages
- Rôles Ansible : odoo_role, pgadmin_role
- Fichier releases.txt pour l'automatisation

<<<<<<< HEAD
☸️ Partie 3 - Kubernetes
=======
 Partie 3 - Kubernetes
>>>>>>> 8e72effd1b2a0355534f9f7b01bcefece82c7f27
- Namespace : icgroup
- Label : env=prod
- Manifests complets pour le déploiement

<<<<<<< HEAD
 🛠️ Technologies Utilisées
=======
 Technologies Utilisées
>>>>>>> 8e72effd1b2a0355534f9f7b01bcefece82c7f27

- Containerisation : Docker, Docker Compose
- CI/CD : Jenkins, Ansible
- Orchestration : Kubernetes, Minikube
- Applications : Python/Flask, Odoo, pgAdmin, PostgreSQL
- Scripting : PowerShell, Bash

 📁 Structure du Projet

\\
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

<<<<<<< HEAD

 Démarrage Rapide


Cloner le projet
git clone <https://github.com/ornellamabin/projet-file-rouge.git>

 Builder l'image Docker
docker build -t ic-webapp:1.0 .

Démarrer les services
=======
 Démarrage Rapide

\\\ash
 Cloner le projet
git clone <url-du-repo>

Builder l'image Docker
docker build -t ic-webapp:1.0 .

 Démarrer les services
>>>>>>> 8e72effd1b2a0355534f9f7b01bcefece82c7f27
docker-compose -f docker-compose.prod.yml up -d

<<<<<<< HEAD

 📊 Résultats
=======
 Résultats
>>>>>>> 8e72effd1b2a0355534f9f7b01bcefece82c7f27

- ✅ 3 applications déployées et fonctionnelles
- ✅ 100% des spécifications respectées
- ✅ Architecture DevOps complète
- ✅ Documentation exhaustive

<<<<<<< HEAD
 👥 Auteurs

- Grace Seha
=======
 Auteur

- Grace Seha

## 📄 Licence

Ce projet est réalisé dans le cadre de la formation DevOps IC Group.

---
*Dernière mise à jour : 2025-11-11*
>>>>>>> 8e72effd1b2a0355534f9f7b01bcefece82c7f27
