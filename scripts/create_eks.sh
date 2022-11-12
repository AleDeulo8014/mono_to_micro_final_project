#!/usr/bin/env bash

ENV_NAME=$1

#Verify if the cluster already exist cluster
VALIDATE=$(aws eks describe-cluster --name $ENV_NAME-personal --query 'cluster.name' --profile $2)
echo "$VALIDATE" > ~/validate
if cat ~/validate | grep "$ENV_NAME-personal"
then
    echo "Cluster $ENV_NAME-personal already exist."
    exit 0
else
    echo "Attempting to create the cluster $ENV_NAME-personal"
fi

#Deploy the cluster if not exist
eksctl create cluster \
    --name $ENV_NAME-personal \
    --version 1.22 \
    --region us-east-1 \
    --nodegroup-name $ENV_NAME-personal-nodegroup \
    --node-type t2.micro \
    --nodes 1 \
    --nodes-min 1 \
    --nodes-max 1 \
    --ssh-access \
    --node-volume-size 10 \
    --ssh-public-key Default_Access_Key \
    --appmesh-access \
    --full-ecr-access \
    --alb-ingress-access \
    --managed \
    --asg-access \
    --verbose 3 \
    --profile $2 && \
    aws eks update-kubeconfig --region us-east-1 --name $ENV_NAME-personal --profile $2 &&\
    sed -i .bak -e 's/v1alpha1/v1beta1/' C:\Users\adf\.kube\.kube\config

    ## Test kube config
    kubectl get pods

    ## Deploy resources and config services
    kubetctl apply -f ./deploy/deployment.yaml
    kubetctl apply -f ./deploy/service.yaml


    ## Add autoscale configs and apply them:
    # kubectl autoscale deployment <NAME> --cpu-percent=<CPU_PERCENTAGE> --min=<MIN_REPLICAS> --max=<MAX_REPLICAS>
    kubectl autoscale deployment my-app-2 --cpu-percent=85  --min=5 --max=3
    kubectl get hpa



