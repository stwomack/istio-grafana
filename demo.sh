for i in $(seq 1 100); do curl -s -o /dev/null "http://$GATEWAY_URL/productpage"; done

ab -n 1000 -c 7 "http://172.18.0.3/productpage"

