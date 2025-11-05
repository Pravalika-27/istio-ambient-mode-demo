#!/bin/bash
set -e
echo "Listing pods in default namespace..."
kubectl get pods -o wide
echo
echo "Testing connectivity: frontend -> backend /status/200"
POD=$(kubectl get pod -l app=frontend -o jsonpath='{.items[0].metadata.name}')
kubectl exec -it $POD -- curl -sS -o /dev/stderr -w "\nHTTP_STATUS:%{http_code}\n" http://backend/status/200 || true
echo
echo "Testing delay route: /delay (should take ~3s)"
kubectl exec -it $POD -- curl -sS -o /dev/stderr -w "\nHTTP_STATUS:%{http_code}\n" http://backend/delay || true
echo
echo "Check istio-system pods (ztunnel, istio-cni)..."
kubectl get pods -n istio-system -o wide
echo
echo "To view Kiali, install addons and port-forward svc/kiali -n istio-system 20001:20001"
