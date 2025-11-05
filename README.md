# istio-ambient-demo

Demo project for Istio Ambient Mode (ready for Minikube).

Quick start:
1. Ensure Minikube is installed and has at least 8GB RAM and 4 CPUs.
2. Start minikube:
   minikube start --memory=8192 --cpus=4 --driver=docker --cni=true
3. Make scripts executable:
   chmod +x scripts/*.sh
4. Install Istio ambient and label namespace:
   ./scripts/install-istio.sh
5. Deploy apps:
   ./scripts/deploy-apps.sh
6. Verify:
   ./scripts/verify.sh

Cleanup:
   ./scripts/cleanup.sh

Notes:
- This demo includes frontend (nginx) and backend (httpbin) services,
  PeerAuthentication (mTLS), AuthorizationPolicy, a waypoint helper,
  and a VirtualService example that injects a fixed delay for L7 testing.
- Observability addons (Kiali/Prometheus/Grafana) can be enabled via
  `kubectl apply -f samples/addons/` after Istio install (optional).
