pipeline {
  agent { label 'cloak' }
  
  environment {
    TOKEN = credentials('netlify-token')
  }
  stages {
    stage("run cloak") {
      steps {
        sh '''
			    ./deploy.sh
        '''
      }
    }
  }
}