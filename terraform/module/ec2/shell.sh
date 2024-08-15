#!bin/bash

# updating linux apps 
"sudo apt update -y",

# installing docker
"sudo apt install docker -y",
"sudo service docker start",

# assign user roles
"sudo usermod -a -G docker $USER",

# install kubelet
"curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl",
"chmod +x kubectl",
"sudo mv kubectl /usr/local/bin/"

# install minikube
"curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64",
"chmod +x minikube",
"sudo mv minikube /usr/local/bin/",
"minikube start --driver=docker",

