pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                    git branch: 'main', url: 'https://github.com/999Rohan/Docker.git'
                    sh '''
                        docker build -t maven-app:1.0.3 .
                    ''' 
            }
        }
        stage('Docker push') {
            steps {
                sh'''
                docker tag maven-app:1.0.3 rohanraga/maven-app:1.2
                docker login -u "rohanraga" -p "@Audi123#" docker.io
                docker push rohanraga/maven-app:1.0
                '''
            }
        }
        stage('create container') {
        steps {
            sh'docker run -it -d --rm -p 8094:8080 --name calc5 maven-app:1.0.3'
        }
    }
        
    }
}
