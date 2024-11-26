# kubectl create ns foo
# kubectl apply -f <(istioctl kube-inject -f ~/istio-1.18.2/samples/httpbin/httpbin.yaml) -n foo
# kubectl apply -f <(istioctl kube-inject -f ~/istio-1.18.2/samples/sleep/sleep.yaml) -n foo
# kubectl create ns bar
# kubectl apply -f <(istioctl kube-inject -f ~/istio-1.18.2/samples/httpbin/httpbin.yaml) -n bar
# kubectl apply -f <(istioctl kube-inject -f ~/istio-1.18.2/samples/sleep/sleep.yaml) -n bar
# kubectl create ns legacy
# kubectl apply -f ~/istio-1.18.2/samples/httpbin/httpbin.yaml -n legacy
# kubectl apply -f ~/istio-1.18.2/samples/sleep/sleep.yaml -n legacy

