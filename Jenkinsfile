pipeline {
  agent { label 'cloak' }
  
  environment {
    TOKEN = credentials('netlify-token')
  }
  stages {
    stage("run cloak") {
      steps {
        sh '''
          FOO=$(echo $TOKEN | base64)
          echo $FOO | base64 -d
          ./deploy.sh
        '''
      }
    }
  }
}
