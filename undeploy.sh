#!/bin/sh

kubectl delete -f hello-k3s.yaml
kubectl delete configmap mysite-html
