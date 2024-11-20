# sudo /usr/local/bin/cloud-provider-kind

kind create cluster -n cloud

kubectl cluster-info --context kind-cloud

istioctl install

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.24/samples/addons/grafana.yaml

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.24/samples/addons/prometheus.yaml

# istioctl dashboard grafana

kubectl label namespace default istio-injection=enabled

kubectl apply -f /usr/local/istio-1.24.0/samples/bookinfo/platform/kube/bookinfo.yaml

kubectl apply -f /usr/local/istio-1.24.0/samples/bookinfo/networking/bookinfo-gateway.yaml

kubectl get svc "$INGRESS_NAME" -n "$INGRESS_NS"

export INGRESS_HOST=$(kubectl -n "$INGRESS_NS" get service "$INGRESS_NAME" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n "$INGRESS_NS" get service "$INGRESS_NAME" -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n "$INGRESS_NS" get service "$INGRESS_NAME" -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export TCP_INGRESS_PORT=$(kubectl -n "$INGRESS_NS" get service "$INGRESS_NAME" -o jsonpath='{.spec.ports[?(@.name=="tcp")].port}')

export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo "Gateway URL: " $GATEWAY_URL

