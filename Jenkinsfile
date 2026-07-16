pipeline {
    agent any

    tools {
        jdk 'JDK'
        maven 'Maven3'
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/birarivb/final_project.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Image') {
            steps {
                sh 'docker build -t final_project .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker rm -f final_project || true
                docker run -d --name final_project -p 2222:5000 final_project
                '''
            }
        }

    }
}
