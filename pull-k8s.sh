#!/bin/bash
images=(kube-proxy-amd64:v1.10.1 kube-scheduler-amd64:v1.10.1 kube-controller-manager-amd64:v1.10.1 
kube-apiserver-amd64:v1.10.1 etcd-amd64:3.1.12 pause-amd64:3.1 kubernetes-dashboard-amd64:v1.8.3 k8s-dns-sidecar-amd64:1.14.8 
k8s-dns-kube-dns-amd64:1.14.8 k8s-dns-dnsmasq-nanny-amd64:1.14.8)
prefix=registry.cn-hangzhou.aliyuncs.com/kubernetes_in_docker
for image in ${images[@]} ; do
  docker pull $prefix/$image
  docker tag $prefix/$image gcr.io/google_containers/$image
  docker rmi $prefix/$image
done
# pull flannel && tag flannel
docker pull $prefix/flannel:v0.9.1-amd64 && docker tag $prefix/flannel:v0.9.1-amd64 quay.io/coreos/flannel:v0.9.1-amd64 &&
docker rmi $prefix/flannel:v0.9.1-amd64
