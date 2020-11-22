pipeline {
    agent any
    tools { 
        maven 'Maven 3.6.3' 
        jdk 'jdk8' 
    }
    stages {
        stage ('Initialize') {
            steps {
                sh 'echo "PATH = ${PATH}"'
                sh 'echo "M2_HOME = ${M2_HOME}"'
            }
        }
        stage('Build') {
            steps {
                sh "mvn -B -DskipTests=true clean package"
            }
        }
        stage('build image') {
            steps {
                sh 'docker build --no-cache -t="franky-ms-api-gateway821" .'
            }
        }
        stage('remove old container if exist') {
            steps {
                sh 'docker rm -f franky-ms-api-gateway821 | true'
            }
        }
        stage('use image run container') {
            steps {
                sh 'docker run --name franky-ms-api-gateway821 --env application-name=ms-api-gateway --env instance-id=api-gateway-1 -d --memory 1024MB --restart=always -p 46557:46557 franky-ms-api-gateway821'
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}
