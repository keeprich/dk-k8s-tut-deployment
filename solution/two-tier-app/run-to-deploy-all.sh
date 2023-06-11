#!/bin/bash

kubectl get po

sleep 5

kubectl apply -f backend-deploy.yaml 

echo 'Creating resources ...................'

sleep 5
 
kubectl apply -f frontend-app-service.yaml 


echo 'Creating resources ...................'

sleep 5

kubectl get po
echo 'Getting pods ...'

sleep 5
