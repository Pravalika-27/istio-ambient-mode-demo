#!/bin/bash
set -e
echo "Starting Minikube (if not already running)..."
minikube start --memory=8192 --cpus=4 --driver=docker --cni=true
echo "Downloading istioctl..."
curl -L https://istio.io/downloadIstio | sh -
ISTIO_DIR=$(ls -d istio-*/ 2>/dev/null | head -n1)
if [ -z "$ISTIO_DIR" ]; then
  echo "istioctl download failed or istio directory not found."
  exit 1
fi
export PATH="$PWD/$ISTIO_DIR/bin:$PATH"
echo "Installing Istio ambient profile..."
istioctl install --set profile=ambient -y
echo "Labeling default namespace for ambient dataplane mode..."
kubectl label namespace default istio.io/dataplane-mode=ambient --overwrite
echo "Done."
