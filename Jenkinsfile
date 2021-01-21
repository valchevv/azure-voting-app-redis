pipeline {
   agent any
   stages {
      stage name: "Always runs",  body: {
         steps {
            echo message: "Hello world"
         }
      }
      stage name: "Runs on master",  body: {
         when { branch 'master' }
         steps {
            echo 'Hello world'
         }
      }
   }
}