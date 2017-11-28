node {
    checkout scm

    docker.withServer('tcp://172.17.0.1:2375') {
        docker.image('mps/tomcat:8').withRun('-p 9292:8080') {
            /* do things */
            sh 'javac -version'
            /* sh 'curl http://localhost:9292' */
        }
        
        def customImage = docker.build("my-image:${env.BUILD_ID}")

        customImage.inside {
            sh 'yum update -y'
        }
    }
}
