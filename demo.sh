ab -n 60 -c 5 -s -v 9 "http://172.18.0.3/productpage"
#for i in $(seq 1 100); do curl -s -o /dev/null "http://172.18.0.3/productpage"; done
