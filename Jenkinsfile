pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                    git branch: 'main', url: 'https://github.com/999Rohan/Docker.git'
                    sh '''
                        docker build -t maven-app .
                    ''' 
            }
        }
        stage('Docker push') {
            steps {
                sh'''
                docker tag maven-app rohanraga/maven-app:1.0
                docker push rohanraga/maven-app:1.0
                '''
            }
        }
        stage('create container') {
        steps {
            sh'docker run -it -d --rm -p 8080:8080 --name calc maven-app'
        }
    }
        
    }
}
