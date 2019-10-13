# Envoy on k8s - Caranry release

```
$ kubectl kustomize base | kubectl apply -f -
$ kubectl port-forward deployment/envoy 8000:80 
$ for i in `seq 1 100`; do curl localhost:8000; done > /tmp/output.txt 2> /dev/null
$ cat /tmp/output.txt| grep "1" | wc -l
```
