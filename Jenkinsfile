pipeline {
    agent any

    tools {
        jdk 'JDK'
        maven 'Maven3'
    }
        environment {
        SONAR_TOKEN = credentials('sonar-token')
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
                docker run -d --name final_project -p 2222:8080 final_project
                '''
            }
            
        }
                stage('SonarQube Analysis') {

            steps {
                withSonarQubeEnv('SonarQube') {
                    sh """
                    mvn sonar:sonar \
                    -Dsonar.projectKey=java-app \
                    -Dsonar.host.url=http://3.110.99.252:9000/ \
                    -Dsonar.login=$SONAR_TOKEN
                    """
                }
            }
        }

    }
}
