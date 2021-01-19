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
                sh(script: """
                cd azure-vote
                pwd
                docker build -t jenkins-pipeline .
                docker images -a
                """)
            }
        }
    }
}
