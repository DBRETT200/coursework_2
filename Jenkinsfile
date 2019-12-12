pipeline {
  environment {
    registry = "dbrett200/coursework2"
    registryCredential = 'dockerhub'
    dockerImage = ' '
  }
    agent {dockerfile true}
    stages {
	
	stage('Cloning Git Repository') {
  steps {
    git 'https://github.com/DBRETT200/coursework_2.git'
  }
}

        stage('Building Docker Image') {
            steps {
			  script {
         dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
            }
        }
		
		stage('Deploy Docker Image ') {
  steps{
    script {
      docker.withRegistry( '', registryCredential ) {
        dockerImage.push()
      }
    }
  }
}
		
        stage('Sonarqube Testing') {
    environment {
        scannerHome = tool 'SonarQube'
    }
    steps {
        withSonarQubeEnv('SonarQube') {
            sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=javascript-sonar-Dsonar.sources=server.js" 
        }
    }
}

	stage('Update Application'){
		
		steps{
		sh 'ssh azureuser@52.146.52.221 ls'
		}
}

    }
}