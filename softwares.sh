#!/bin/bash

#echo "Inatalling....................."
#i=0
#if [[ i -ge 0 ]];
#  then
#	  echo "Success...."
#  fi


# Installing Minikube..........
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --force


# Installing Flux............
git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin
eval $(~/.linuxbrew/bin/brew shellenv)

brew install fluxcd/tap/flux
export GITHUB_TOKEN=<your-token>
export GITHUB_USER=<your-username>
flux check --pre

# Installing Kubectl,configuring it and install docker 

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl 
sudo mv ./kubectl /usr/local/bin/kubectl
sudo apt-get update && \
    sudo apt-get install docker.io -y
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
 minikube version

