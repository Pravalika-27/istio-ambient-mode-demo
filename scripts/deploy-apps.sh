#!/bin/bash
set -e
echo "Deploying frontend and backend..."
kubectl apply -f manifests/frontend.yaml
kubectl apply -f manifests/backend.yaml
echo "Waiting for pods..."
kubectl wait --for=condition=ready pod -l app=frontend --timeout=120s || true
kubectl wait --for=condition=ready pod -l app=backend --timeout=120s || true
echo "Applying security policies (mTLS + AuthZ)..."
kubectl apply -f manifests/peer-authentication.yaml
kubectl apply -f manifests/authorization-policy.yaml
echo "Applying VirtualService..."
kubectl apply -f manifests/virtual-service.yaml
echo "Done."
