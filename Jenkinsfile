pipeline {
  agent { label 'cloak' }
  
  environment {
    netlifyToken = credentials('netlify-token')
  }
  stages {
    stage("run Dagger") {
      steps {
        sh '''
          eval "$(ssh-agent -s)"
          TOKEN='''+netlifyToken+''' ./deploy.sh
        '''
      }
    }
  }
}
