pipeline {
    agent any

    stages {
        stage('Verify branch') {
            steps {
                echo "$GIT_BRANCH"
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker images -a'
                sh 'pwd'
               /*  sh 'cd azure-azure-vote'
                sh 'docker build -t jenkins-pipeline .'
                sh 'docker images -a ; cd ..' */
            }
        }
    }
}
