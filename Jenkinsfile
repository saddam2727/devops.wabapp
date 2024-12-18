node('agent1') {
    try {
        stage('Checkout Code from GitHub') {
            git branch: 'main', url: 'https://github.com/Radhakrishnaaaaa/devops.wabapp.git'
        }

        stage('Build Source Code') {
            sh 'mvn clean install'
        }

        stage('SonarQube Analysis') {
            // Define the path to the sonar-scanner binary
            def sonarScannerPath = "/opt/sonar-scanner/bin"

            // Validate if sonar-scanner exists and run it
            sh """
            ${sonarScannerPath}/sonar-scanner
            """
        }
    } catch (Exception e) {
        // Handle any exceptions in the pipeline
        echo "An error occurred: ${e.getMessage()}"
        currentBuild.result = 'FAILURE'
        throw e
    }
}







node('agent1') {
        stage('Checkout Code from GitHub') {
            git branch: 'main', url: 'https://github.com/Radhakrishnaaaaa/devops.wabapp.git'
        }

        stage('Build Source Code') {
            sh 'mvn clean install'
        }
        stage('build docker image'){
            sh ''' docker build -t docker1 . '''
        }
        stage ('run the container'){
            sh ''' docker stop con1 '''
            sh ''' docker rm -f con1 '''
            sh ''' docker run --name con1 -itd -p 8081:8080 docker1 '''
        }
        stage ('change image tag') {
            sh ''' docker tag docker1 saddamsk/image1:version1 '''
        }
        stage ('push to dockerhub') {
            script {
                withDockerRegistry(credentialsId: 'docker') {
                sh ''' docker push saddamsk/image1:version1 '''
                }
            }
        }
}



===============================================================


pipeline {
    agent any 
    stages {
        stage ('checkout code from github') {
            steps {
                git branch: 'main', url: 'https://github.com/Radhakrishnaaaaa/devops.wabapp.git'
            }
        }
        stage ('build the code') {
            steps {
                sh ''' mvn clean install '''
            }
        }
        stage ('build the docker image') {
            steps {
                sh ''' docker build -t img1 . '''
            }
        }
        stage ('change build tag') {
            steps {
                sh ''' docker tag img1 radhakrishnabadugu94/docker:version1 '''
            }
        }
        stage ('push to dockerhub') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker') {
                    sh ''' docker push radhakrishnabadugu94/docker:version1 '''
                    }
                }
            }
        }
        stage ('deploy app in docker container') {
            steps {
                sh ''' docker run --name con2 -itd -p 8082:8080 radhakrishnabadugu94/docker:version1 '''
            }
        }
    }
}
