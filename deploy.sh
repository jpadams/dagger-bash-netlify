#!/bin/bash

BUILD=$(cloak -p ./cloak.yaml do<<EOF
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
)
CONTENTS=$(echo -n $BUILD | jq -r '.core.git.yarn.id')

DEPLOY=$(cloak -p ./cloak.yaml --set "contents=$CONTENTS" --secret "token=$TOKEN" do<<'EOF'
query Deploy($contents: FSID!, $token: SecretID!) {
  netlify {
    deploy(
      contents: $contents,
      token: $token,
      siteName: "jeremy-noo",
      subdir: "build",
    ) {
      deployURL
    }
  }
}
EOF
)
URL=$(echo -n $DEPLOY | jq -r '.netlify.deploy.deployURL')
echo $URL
