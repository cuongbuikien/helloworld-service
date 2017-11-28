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
                withDockerServer([credentialsId: '', uri: "unix:///var/run/docker.sock"]) {
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
