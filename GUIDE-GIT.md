 Guide de Déploiement Git - Projet DevOps IC Group

📋 Prérequis
 Compte GitHub/GitLab
 Git installé sur la machine
 Accès en ligne

 Configuration Initiale

 1. Configuration Git

git config --global user.name "Votre Nom"
git config --global user.email "votre@email.com"


 2. Création du Repository sur GitHub
1. Allez sur https://github.com
2. Cliquez sur \"+\" → \"New repository\"
3. Nom : \"projet-icgroup-devops\"
4. Description : \"Projet DevOps complet pour IC Group\"
5. Public/Private selon votre choix
6. Ne pas initialiser avec README 

 3. Connexion au Repository

git remote add origin https://github.com/votrenom/projet-icgroup-devops.git
git branch -M main
git push -u origin main


 📤 Commandes Git Utiles

 Vérifier le statut

git status


 Ajouter des fichiers

git add .                    Tous les fichiers
git add nomfichier           Fichier spécifique


 Faire un commit

git commit -m \"Description des modifications\"


 Pousser les modifications

git push origin main


Voir l'historique

git log --oneline


🎯 Structure Recommandée pour les Commits


🎉 Fonctionnalité : Description
🐛 Correction : Description
📝 Documentation : Description
♻️ Refactor : Description


 📞 Support

En cas de problème avec Git, consulter :
- Documentation Git : https://git-scm.com/doc
- GitHub Help : https://help.github.com


