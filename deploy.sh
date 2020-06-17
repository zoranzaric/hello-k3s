#!/bin/sh

kubectl create configmap mysite-html --from-file index.html
kubectl create -f hello-k3s.yaml
