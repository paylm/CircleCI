#!/bin/bash



## 准备 kubeconfig 配置

#alias kubectl=`kubectl --kubeconfig=/tmp/kubelet.kubeconfig`

## 初始 , 采用 kustomize 实现
# namespace
function install() {
  namespace=${1:default}
  #创建namespace
  kubectl create namespace $namespace
  #创建资源
  kubectl apply -f k8s -n $namespace
}

####
# 更新镜像 kubectl set image deployment  <deploymentName> <containerName>=<image> -n namespace
# deployment
# containerName
# image
# namespace
function update-app(){
   deployment=$1
   containerName=${2}
   image=$3
   namespace=${4:test}
   if [ "$deployment" != "" ];then
     kubectl set image deployment $deployment $containerName=$image -n $namespace
   fi
}

function update-service(){
  echo "更新service"
}

###
# 更新文.env
function update-env(){
  echo "从1password获取资源，更新.env"
}

function main() {
    $1 ${@:2}
}

#
main $*
