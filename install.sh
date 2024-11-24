#kube dashboard

kubectl create serviceaccount cluster-admin-dashboard-sa
kubectl create clusterrolebinding cluster-admin-dashboard-sa  --clusterrole=cluster-admin --serviceaccount=default:cluster-admin-dashboard-sa
kubectl -n default create token cluster-admin-dashboard-sa --duration=10000h
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443

/Users/dimuthusenanayaka/workspace/hands-istio/istio-1.23.2/bin/istioctl install

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/grafana.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/prometheus.yaml

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/kiali.yaml

#kiali istio darshboard
/Users/dimuthusenanayaka/workspace/hands-istio/istio-1.23.2/bin/istioctl dashboard kiali

#jaeger
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/jaeger.yaml

/Users/dimuthusenanayaka/workspace/hands-istio/istio-1.23.2/bin/istioctl dashboard jaeger

k label ns default istio-injection=enabled

