pipeline {
  agent { label 'cloak' }
  
  environment {
    TOKEN = credentials('netlify-token')
  }
  stages {
    stage("prep") {
      steps {
        sh '''
          eval "$(ssh-agent -s)"
        '''
      }
    }

    stage("run Dagger") {
      steps {
        sh '''
          ./deploy.sh
        '''
      }
    }
  }
}
