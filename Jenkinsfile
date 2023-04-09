pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }

        stage('Build image') {
            steps {
                script {
                    app = docker.build("mosesdock/app")
                }
            }
        }

        stage('Test image') {
            steps {
                script {
                    app.inside {
                        sh 'echo "Tests passed"'
                    }
                }
            }
        }

        stage('Push image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        app.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }

        stage('Deploy App on k8s') {
            steps {
                echo 'Deploying....'
                withKubeConfig([credentialsId: 'mykubeconfig']) {
                sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}    