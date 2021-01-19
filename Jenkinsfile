pipeline {
    agent any

    stages {
        stage('Verify branch') {
            steps {
                echo $GIT_BRANCH
            }
        }
                stage('Goodbye world') {
            steps {
                echo 'Goodbye world'
            }
        }
        stage('pws Hello') {
            steps { 
                pwsh 'Write-Output "Hello PowerShell"'
            }
        }
    }
}
