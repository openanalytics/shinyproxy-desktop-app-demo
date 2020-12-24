pipeline {
    agent {
        kubernetes {
            yamlFile 'kubernetesPod.yaml'
            defaultContainer 'dind'
        }
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '3'))
    }

    environment {
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh './build.sh'
            }
        }

        stage('Push to Docker Hub') {
            environment {
                NS = 'openanalytics'
            }
            steps {
                withDockerRegistry([
                    url: '',
                    credentialsId: 'openanalytics-dockerhub']) {
                        sh '''
                        docker tag shinyproxy-desktop-app-demo:phaedra openanalytics/shinyproxy-desktop-app-demo:phaedra
                        docker tag shinyproxy-desktop-app-demo:vscode openanalytics/shinyproxy-desktop-app-demo:vscode
                        docker push openanalytics/shinyproxy-desktop-app-demo:phaedra
                        docker push openanalytics/shinyproxy-desktop-app-demo:vscode
                        '''
                    }
            }
        }
    }
}
