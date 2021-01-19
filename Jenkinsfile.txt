pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
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
