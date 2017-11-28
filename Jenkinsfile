node {
    checkout scm

    docker.withServer('tcp://172.17.0.1:2375') {
        docker.image('mysql:5').withRun('-p 3306:3306') {
            /* do things */
        }
    }
}
