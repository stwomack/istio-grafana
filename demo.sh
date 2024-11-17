for i in $(seq 1 100); do curl -s -o /dev/null "http://$GATEWAY_URL/productpage"; done


ab -n 160 -c 3 -s 60 "http://172.18.0.3/productpage"
