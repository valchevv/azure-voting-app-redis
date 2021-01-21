pipeline {
   agent any

   stages {
      stage('Verify Branch') {
         steps {
            echo "$GIT_BRANCH"
         }
       }
      stage('Docker Build') {
         steps {
            sh(script: 'docker images -a')
            sh(script: """
               cd azure-vote/
               docker images -a
               docker build -t valchevv/jenkins-course:latest .
               docker images -a
               cd ..
            """)
         }
      }
      stage('Start test app') {
         steps {
            pwsh(script: """
               docker-compose up -d
               ./scripts/test_container.ps1
            """)
         }
         post {
            success {
               echo "App started successfully :)"
            }
            failure {
               echo "App failed to start :("
            }
         }
      }
      stage('Run Tests') {
         steps {
            sh(script: """
               pytest ./tests/test_sample.py
            """)
         }
      }
      stage('Stop test app') {
         steps {
            sh(script: """
               docker-compose down
            """)
         }
      }
      stage('Push container') {
          steps {
              echo "Workspace is $WORKSPACE"
              dir("$WORKSPACE/azure-vote") {
                  script {
                      docker.withRegistry('https://index.docker.io/v1/', 'DockerHub') {
                          def image = docker.build('valchevv/jenkins-course:latest')
                          image.push()
                      }
                  }
              }
          }
      }
      stage('Trivy scan') {
         steps {
            sh(script: 'trivy valchevv/jenkins-course')
         }
      }
      stage('Analyze with Anchore plugin') {
         steps {
         echo 'valchevv/jenkins-course' > anchore_images
         anchore engineCredentialsId: 'Anchor', engineurl: 'http://localhost:8228/v1', name: 'anchore_images'
         /*writeFile file: 'anchore_images', text: imageLine
         anchore name: 'anchore_images' */
      }
    }
   }
}
