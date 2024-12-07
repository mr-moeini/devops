##using aliyun mirror
echo "50.7.85.222 k8s.io proxy.golang.org" >> /etc/hosts
kubeadm config images pull --image-repository=registry.aliyuncs.com/google_containers

