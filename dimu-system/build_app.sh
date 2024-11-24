cd dimu-system
#eval $(minikube -p minikube docker-env)
#docker image build -t ui_app ./ui-app
#docker image build -t pay_app ./pay-app
#docker image build -t credit_app ./credit-app

#kubectl delete -f ui-service.yaml
kubectl apply -f ui-service.yaml

#kubectl delete -f pay-service.yaml
kubectl apply -f pay-service.yaml

#kubectl delete -f credit-service.yaml
kubectl apply -f credit-service.yaml

#sleep 5

#nohup kubectl port-forward service/ui-service 8081:80 > /dev/null  ;
#nohup kubectl port-forward service/pay-service 8082:80 > /dev/null ;
#nohup kubectl port-forward service/credit-service 8083:80 > /dev/null ;

#open -n -a "Google Chrome" --args  "http:localhost:8081";
#open -n -a "Google Chrome" --args  "http:localhost:8082";
#open -n -a "Google Chrome" --args  "http:localhost:8083";

#while true ; do curl http://localhost:8081 ; sleep 0.5 ; doneo

#canery
#kubectl delete -f istio_canery_pay_service.yaml
kubectl apply -f istio_canery_pay_service.yaml

#gw
kubectl delete -f istio-gw.yaml
kubectl apply -f istio-gw.yaml

# minikube service istio-ingressgateway -n istio-system
#  while true ; do  curl --header 'Host: ui.service' http://127.0.0.1:49659 ; sleep 0.5 ; done
#  while true ; do  curl --header 'Host: pay.service' http://127.0.0.1:49659 ; sleep 0.5 ; done
