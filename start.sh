rm nohup.out
kill $(ps -ef | grep 'Desktop.app/Contents/MacOS/Dockerfile Desktop' | grep -v grep | awk '{print $2}')
sleep 25
open -a Docker.appvi

sleep 25

kill $(ps -ef | grep 'minikube start' | grep -v grep | awk '{print $2}')
nohup minikube start &

sleep 25

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

kill $(ps -ef | grep 'port-forward' | grep -v grep | awk '{print $2}')
nohup kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443 &

#kiali istio darshboard
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/kiali.yaml
kill $(ps -ef | grep 'dashboard kiali' | grep -v grep | awk '{print $2}')
nohup /Users/dimuthusenanayaka/workspace/hands-istio/istio-1.23.2/bin/istioctl dashboard kiali &

#jaeger
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.23/samples/addons/jaeger.yaml
kill $(ps -ef | grep 'dashboard jaeger' | grep -v grep | awk '{print $2}')
nohup /Users/dimuthusenanayaka/workspace/hands-istio/istio-1.23.2/bin/istioctl dashboard jaeger &

kubectl label ns default istio-injection=enabled

sleep 30
open -n -a "Google Chrome" --args  "https://localhost:8443/#/workloads?namespace=default"



