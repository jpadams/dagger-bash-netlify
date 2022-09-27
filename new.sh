#!/bin/bash

DEPLOY=$(cloak -p ./cloak.yaml --secret "token=$TOKEN" do<<'EOF'
query Deploy($token: SecretID!) {
  core {
    git(remote: "https://github.com/dagger/todoapp", ref: "cloak") {
      yarn(runArgs: "build") {
        netlifyDeploy(
          subdir: "build"
          siteName: "jeremy-new"
          token: $token) {
            url
         }
      }
    }
  }
}
EOF
)
URL=$(echo -n $DEPLOY | jq -r '.core.git.yarn.netlifyDeploy.url')
echo $URL
