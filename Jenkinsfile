pipeline {
    agent any
    tools { 
        maven 'Maven3'
    }

    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
            }
        }

        stage('Build') {
            steps {
                echo 'Building..'
                withDockerServer([credentialsId: '', uri: "tcp://172.17.0.1:2375"]) {
                    docker.build("db", "-f Dockerfile .")
                }

                sh 'docker ps -a'
                sh 'docker build -f Dockerfile .'
                sh 'mvn clean compile package'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                docker ps -a
            }
        }
    }
}
