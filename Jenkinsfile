pipeline {
   agent any
   stages {
      stage('Deploy to QA') {
         environment {
            ENVIRONMENT = 'demo'
         }
         steps {
            echo "Deploying to ${ENVIRONMENT}"
            acsDeploy(
               azureCredentialsId: "azure-jenkins-app",
               configFilePaths: "**/*.yaml",
               containerService: "k8s-${ENVIRONMENT}-cluster | AKS",
               resourceGroupName: "main-rg",
               sshCredentials: ""
            )
         }
      }
      stage('Approve PROD Deploy') {
         when {
            branch 'master'
         }
         options {
            timeout(time: 1, unit: 'HOURS')
         }
         steps {
            input message: "Deploy?"
         }
         post {
            success {
               echo message: "Production deploy approved"
            }
            aborted {
               echo message: "Production deploy denied"
            }
         }
      }
      stage name: "Deploy to prod",  body: {
         when {
            branch 'master'
         }
         environment {
            ENVIRONMENT = 'prod'
         }
         steps {
            echo message: "Deploying to ${ENVIRONMENT}"
            acsDeploy(
               azureCredentialsID: "azure-jenkins-app",
               configFilePaths: "**/*.yaml",
               containerService: "k8s-${ENVIRONMENT}-cluster | AKS",
               resourceGroupName: "main-rg",
               sshCredentialsId: ""
            )
         }
      } 
   }
}