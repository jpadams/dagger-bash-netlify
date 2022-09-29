pipeline {
  agent { label 'cloak' }
  
  environment {
    TOKEN = credentials('netlify-token')
  }
  stages {
    stage("run Dagger") {
      steps {
        sh '''
          eval "$(ssh-agent -s)"
          ./deploy.sh
        '''
      }
    }
  }
}
