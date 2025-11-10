pipeline {
    agent any
    
    environment {
        // Lire la version depuis releases.txt avec grep/cut
        VERSION = sh(script: 'grep \"^Version\" releases.txt | cut -d\" \" -f2', returnStdout: true).trim()
        IMAGE_NAME = 'ic-webapp'
        REGISTRY = 'votredockerhub/'
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Lire les URLs depuis releases.txt avec grep/cut
                    def ODOO_URL = sh(script: 'grep \"^ODOO_URL\" releases.txt | cut -d\" \" -f2', returnStdout: true).trim()
                    def PGADMIN_URL = sh(script: 'grep \"^PGADMIN_URL\" releases.txt | cut -d\" \" -f2', returnStdout: true).trim()
                    
                    echo "Building version: "
                    echo "ODOO_URL: "
                    echo "PGADMIN_URL: "
                    
                    // Build l'image Docker
                    sh "docker build -t : ."
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    // Tests de l'application
                    sh "docker run -d --name test-app -p 8080:8080 :"
                    sleep 10
                    
                    // Test de réponse HTTP
                    sh "curl -f http://localhost:8080 || exit 1"
                    
                    // Vérifier les logs
                    sh "docker logs test-app"
                    
                    // Nettoyer
                    sh "docker stop test-app && docker rm test-app"
                }
            }
        }
        
        stage('Deploy Odoo') {
            steps {
                ansiblePlaybook(
                    playbook: 'odoo_role/tasks/main.yml',
                    extraVars: [
                        network_name: 'icgroup-network',
                        volume_path: '/opt/odoo_data'
                    ]
                )
            }
        }
        
        stage('Deploy pgAdmin') {
            steps {
                ansiblePlaybook(
                    playbook: 'pgadmin_role/tasks/main.yml',
                    extraVars: [
                        network_name: 'icgroup-network',
                        pgadmin_email: 'admin@icgroup.com',
                        pgadmin_password: 'admin123'
                    ]
                )
            }
        }
    }
    
    post {
        always {
            // Nettoyage
            sh 'docker system prune -f'
        }
        success {
            echo 'Pipeline exécuté avec succès!'
        }
        failure {
            echo 'Pipeline a échoué!'
        }
    }
}
