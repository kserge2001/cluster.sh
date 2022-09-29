#!/bin/bash
sudo kubectl apply -f "https://raw.githubusercontent.com/fazlurkh/pods/main/ts.yaml"
sudo kubectl taint node `kubectl get nodes --no-headers | tail -2 | awk '{print $1}'` cka=test:NoSchedule >> /dev/null
sudo kubectl run ckaexam --image nginx
sudo mkdir -p ~/backup
sudo cp ~/.kube/config ~/backup/
sudo sed -e 's/6443/9663/g' -i ~/.kube/config
sudo cp /etc/kubernetes/manifests/kube-apiserver.yaml ~/backup/
sudo sed -e 's/RBAC/RBAC,FAZLUR/g' -i /etc/kubernetes/manifests/kube-apiserver.yaml
sudo systemctl disable --now kubelet >> /dev/null
echo " Opps ... Looks like your cluster is broken, Please fix it ... "
