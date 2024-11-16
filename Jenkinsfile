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
