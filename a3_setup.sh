kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml

kubectl apply -f k8s/manifests/backend-service.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl apply -f k8s/manifests/backend-ingress.yaml
kubectl apply -f k8s/manifests/backend-hpa.yaml
kubectl apply -f k8s/manifests/backend-zone-aware.yaml
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

kubectl -nkube-system edit deploy/metrics-server
kubectl -nkube-system rollout restart deploy/metrics-server