pipeline {
  agent { label 'cloak' }
  
  environment {
    netlify-token = credentials('netlify-token')
  }
  stages {
    stage("run Dagger") {
      steps {
        sh '''
          eval "$(ssh-agent -s)"
          TOKEN='''+$netlify-token+''' ./deploy.sh
        '''
      }
    }
  }
}
