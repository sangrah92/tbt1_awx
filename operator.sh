#!/bin/bash

# Clone Operator Repo and Deploy
git clone https://github.com/ansible/awx-operator.git
cd awx-operator
git checkout tags/2.7.2
export VERSION=2.7.2

# Deploy awx-operator
make deploy

# Back to Home Directory
cd ..

# Apply Kustomization and deploy awx
kubectl apply -k .

# Set Default Namespace awx
kubectl config set-context --current --namespace=awx

# PODs created by Operator
kubectl get pods -l "app.kubernetes.io/managed-by=awx-operator"

# Get SVC List
kubectl get svc -l "app.kubernetes.io/managed-by=awx-operator"

# Print AWX Password
kubectl get secret awx-demo-admin-password -o jsonpath="{.data.password}" | base64 --decode;