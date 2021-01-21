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
                azureCredentialsId: 'nls-jenkins',
                 configFilePaths: '**/*.yaml',
                  containerService: 'k8s-demo-cluster | AKS',
                   dcosDockerCredentialsPath: '',
                    resourceGroupName: 'main-rg',
                     secretName: '',
                      sshCredentialsId: ''
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
      stage("Deploy to prod")  {
         when {
            branch 'master'
         }
         environment {
            ENVIRONMENT = 'prod'
         }
         steps {
            echo message: "Deploying to ${ENVIRONMENT}"
            acsDeploy(
                azureCredentialsId: 'nls-jenkins', 
                configFilePaths: '**/*.yaml', 
                containerService: 'k8s-prod-cluster | AKS', 
                dcosDockerCredentialsPath: '', 
                resourceGroupName: 'main-rg', 
                secretName: '', 
                sshCredentialsId: ''
            )
         }
      } 
   }
}