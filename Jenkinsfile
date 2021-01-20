pipeline {
   agent any

   stages {
      
      stage('Anchor scan') {
         steps {
/*             anchore engineCredentialsId: 'Anchor', engineurl: 'http://localhost:8228/v1', name: 'anchore_images' */
               node {
               def imageLine = 'valchevv/jenkins-course:latest'
               writeFile file: 'anchore_images', text: imageLine
               anchore name: 'anchore_images'
            }
         }
      }
   }
}
