# Kodecamp Promotional Task 8

- Build docker image -> docker build -t promotional-task-8 ./
- run the dockerfile -> docker run promotional-task-8:latest
- tag the docker container -> docker tag kodecamppromotionaltask8:latest codesmiles/promotional-task-8:latest
- push docker image 
est
- docker image name  -> codesmiles/promotional-task-8:latest
- docker hub link -> https://hub.docker.com/repository/docker/codesmiles/promotional-task-8/general

## Deploy the app to your minikube cluster

### requirements

- install minikube (see <https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download>)
- install kubernetes (see <https://kubernetes.io/docs/tasks/tools/>)
- start minikube -> minikube start or minikube start nodes 4 -p sandbox
- change directory to the kube folder -> cd kube
- apply the kubernetes deployment -> kubectl apply -f kube-deployment.yaml
- geting he pods to show you list of pods created -> kubectl get pods
- get minikube profiles ->  minikube profile list 
- deploy kube service -> kubectl apply -f kube-service.yaml
- get kubeservice -> kubectl get service

## Steps

- Step 1: Prepare the Code Repository
  - Create a Repository on GitHub:
  - Create a new repository on GitHub and push your application code.
  - Add Your Application Code:
  - Add your application code to the repository.
[LINK TO THE REPOSITORY](https://github.com/codesmiles/kodecamp-promotional-task-8)
- Ensure you have a Dockerfile for your application to containerize it
  [Link to Dockerfile](/Dockerfile)
- Push image to Docker image registry
  - docker image name  -> codesmiles/promotional-task-8:latest
  - docker hub link -> <https://hub.docker.com/repository/docker/codesmiles/promotional-task-8/general>
- Create Kubernetes Manifests:
  - Add the necessary Kubernetes manifests (e.g., deployment.yaml, service.yaml) to a k8s directory in your repository.
    - [Link to Kube deployment](/kube/kube-deployment.yaml)
    - [link to kube service yaml](/kube/kube-service.yaml)
- Step 2: Set Up GitHub Actions
  - Create a GitHub Actions Workflow:
    - In your repository, create a .github/workflows directory.
    - Create a YAML file (e.g., deploy.yml) inside this directory with the required configurations.
    [Click Here To access the file](.github/workflows/deploy.yml)
- Step 3: Set Up Terraform for EC2 and Minikube
  - Create Terraform Module:
    - Create terraform modules for your EC2, VPC, and any other resources you would like to use (taking considerations of the cost)
    - Initialize and Apply Terraform Configuration:
    - Create root modules
    - Run the appropriate Terraform commands in your terminal to create an EC2 instance with Minikube running on it.
    [Click here to access the terraform file](/terraform/minikube)
    ![Image to the teraform plan](/assets/terraform%20plan.png)
- Step 4: Access the Minikube Cluster
  - SSH into EC2 Instance:
    - SSH into the created EC2 instance using the public IP output from Terraform.
  ![ssh to ec2 instance](/assets/ssh_to_ec2_instance.png)
    - Configure kubectl:
    - Inside the EC2 instance, configure kubectl to use the Minikube cluster.
  [Link to the shell configuration](/terraform/module/ec2/shell.sh)
- Step 5: Automate Deployment with GitHub Actions
  - Update GitHub Actions Workflow:
    - Update the GitHub Actions workflow to deploy to the Minikube cluster on the EC2 instance. Ensure the Minikube instance's IP and SSH keys are securely managed.
  ![Github action deployment](/assets/github_action.png)
  ![AWS instance deployment](/assets/aws_instance.png)
