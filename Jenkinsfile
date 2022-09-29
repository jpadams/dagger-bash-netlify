pipeline {
  agent { label 'cloak' }
  
  environment {
    TOKEN = credentials('netlify-token')
    BUILD = "${sh(script:'''
	cloak -p ./cloak.yaml do<<EOF
		query Build {
  			core {
    			git(remote: "https://github.com/dagger/todoapp", ref: "cloak") {
      				yarn(runArgs: "build") {
        				id
      				}
    			}
  			}
		}
	EOF
	''', returnStdout: true).trim()}"

	CONTENTS = "${sh(script:'''
		echo -n $BUILD | jq -r '.core.git.yarn.id'
	''', returnStdout: true).trim()}")

  stages {
    stage("run Dagger") {
      steps {
        sh '''
          echo $CONTENTS
        '''
      }
    }
  }
}
