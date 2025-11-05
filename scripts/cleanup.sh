#!/bin/bash
set -e
echo "Deleting demo resources..."
kubectl delete -f manifests/ --ignore-not-found=true
echo "Uninstalling Istio..."
istioctl uninstall --purge -y || true
echo "Stopping minikube..."
minikube delete || true
echo "Done."
