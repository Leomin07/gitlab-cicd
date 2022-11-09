## CICD GITLAB


1. Add private key server to Gitlab (Setting => CICD => Variables => Add new variable, set type variable: variable)
2. Set branch default: develop
3. create file gitlab-ci.yml
```
stages:
  - DeployDevelop

DeployDevelop:
  stage: DeployDevelop
  image: leomin07/node:14-buster-slim
  only: ['develop']
  script:
    - mkdir -p ~/.ssh
    - ssh-keyscan -H '13.250.126.107' >> ~/.ssh/known_hosts
    - echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    - chmod 700 ~/.ssh/id_rsa
    - ssh ubuntu@13.250.126.107 "cd ~/chat-api && sudo rm -rf src"
    - rsync --progress -avzh -e "ssh " --rsync-path="sudo rsync" --exclude='.git' . ubuntu@13.250.126.107:~/chat-api
    - ssh ubuntu@13.250.126.107 "cd ~/chat-api && sudo yarn install && sudo yarn build && pm2 restart --update-env main && pm2 save"

```
