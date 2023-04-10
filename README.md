# Jenkins Pipeline for Building Flask Python App and Deploying on Minikube Cluster
This is a Jenkins pipeline for building a Flask Python app and deploying it on a Minikube cluster. The pipeline includes the following stages:

* Checkout: Checkout the code from the Git repository.
* Build Docker Image: Build a Docker image for the Flask Python app and tag it with the current build number.
* Push to Docker Hub: Push the Docker image to Docker Hub using the docker CLI and the credentials stored in Jenkins.
* Deploy to Minikube: Deploy the Flask Python app on the Minikube cluster using the kubectl CLI and the credentials stored in Jenkins.
* Expose with Port 443: Expose the Flask Python app to the outside world using port 443.
# Prerequisites
 Before you can run this Jenkins pipeline, you will need to have the following installed on your system:

* Jenkins: This pipeline has been tested on Jenkins version 2.399 running inside a Docker container.
* Docker: This pipeline assumes that you have Docker installed and configured on your system.
* Kubectl: This pipeline assumes that you have kubectl installed and configured on your Jenkins Docker container.
# Jenkins Configuration
 To use this pipeline, you will need to configure the following in Jenkins:

* Git Plugin: Install the Git plugin for Jenkins so that the pipeline can checkout the code from the Git repository.
* Docker Credentials: Configure Docker Hub credentials in Jenkins so that the pipeline can push the Docker image to Docker Hub.
* Kubernetes Credentials: Configure the kubeconfig file with the credentials to access your Kubernetes cluster.
* Kubernetes Plugin: Install the Kubernetes plugin for Jenkins so that the pipeline can deploy the app on the Minikube cluster.
