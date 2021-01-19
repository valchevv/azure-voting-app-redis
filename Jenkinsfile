pipeline {
    agent any

    stages {
        stage('Verify branch') {
            steps {
                echo $GIT_BRANCH
                pwsh 'Write-Output "Hello PowerShell"'
            }
        }
    }
}
