# rke2-install

## Master

### Install RKE2 Server (Master Node)
```
wget https://raw.githubusercontent.com/virtualmo/rke2-install/main/rke2-master.sh
chmod +x rke2-master.sh
sudo ./rke2-master.sh
```

### Prepare RKE2 Server (Master Node)
```
wget https://raw.githubusercontent.com/virtualmo/rke2-install/main/rke2-prep-master.sh
chmod +x rke2-prep-master.sh
sudo ./rke2-prep-master.sh
```


### Install RKE2 Agent (Worker Node)
- get the node token from the server (sudo cat /var/lib/rancher/rke2/server/node-token)
```
wget https://raw.githubusercontent.com/virtualmo/rke2-install/main/rke2-worker.sh
chmod +x rke2-worker.sh
sudo ./rke2-worker.sh <SERVER_IP> <NODE_TOKEN>
```

### Install Rancher (Master Node)
```
sudo cp /etc/rancher/rke2/rke2.yaml kube_config_cluster.yml
mkdir .kube
sudo cp /etc/rancher/rke2/rke2.yaml .kube/config
sudo chown $USER kube_config_cluster.yml
wget https://raw.githubusercontent.com/axeal/tf-do-rke/master/rancher-install.sh
chmod +x rancher-install.sh
sudo ./rancher-install.sh -H <HOSTNAME> -v <VERSION>
kubectl --kubeconfig kube_config_cluster.yml get nodes
```
