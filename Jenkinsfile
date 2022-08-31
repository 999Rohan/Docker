pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                    git branch: 'main', url: 'https://github.com/999Rohan/Docker.git'
                    sh '''
                        docker build -t maven-app:1.0.1 .
                    ''' 
            }
        }
        stage('Docker push') {
            steps {
                sh'''
                docker tag maven-app:1.0.1 rohanraga/maven-app:1.0
                docker push rohanraga/maven-app:1.0
                '''
            }
        }
        stage('create container') {
        steps {
            sh'docker run -it -d --rm -p 8090:8080 --name calc1 maven-app:1.0.1'
        }
    }
        
    }
}
