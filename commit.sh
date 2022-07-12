#!/bin/bash


DEPLOY_TYPE=k8s
# 读取参数
action=${1:update-app}
app=$2
deployment=$3
#containerName=${4}
image=$4
env=${5:integration}
edition=${6:-vika}

          git config --global user.name "${{ env.CI_COMMIT_AUTHOR }}"
          git config --global user.email "username@users.noreply.github.com"
          git stash
          git pull
          git checkout -b deploy-version origin/deploy-version

          mkdir -p ${edition}-${env}
          echo "${image}" > ${edition}-${env}/${app}.version
          git add *
          git commit -a -m "${{ env.CI_COMMIT_MESSAGE }}"
          git push