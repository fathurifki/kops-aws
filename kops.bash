#!/bin/bash

echo 'Install Kubectl'
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
sudo apt-get update
echo 'Install Kops'
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
sudo apt-get update
echo 'Install Aws-CLI'
sudo apt-get install awscli -y
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
aws configure

'echo export to BASHRC'
export bucket_name={YOUR_BUCKET_NAME}
export KOPS_CLUSTER_NAME={YOUR_KOPS_CLUSTER_NAME}
export KOPS_STATE_STORE=s3://${bucket_name}

echo 'Create Cluster'
kops create cluster --zones=ap-southeast-1a --name=${KOPS_CLUSTER_NAME} --ssh-public-key=~/.ssh/authorized_keys
echo 'Get Cluster'
kops get cluster
echo 'Validate Cluster'
kops validate cluster
echo 'Update Cluster'
kops update cluster --name ${KOPS_CLUSTER_NAME} --yes
