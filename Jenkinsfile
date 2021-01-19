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
                pwsh 'docker images -a')
                pwsh """
                cd azure-azure-vote/
                docker images -a
                docker build -t jenkins-pipeline .
                docker images -a
                cd ..
                """)
            }
        }
    }
}
