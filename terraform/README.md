# 02. Jumpbox

- `tf output -json | jq -r ".private_key_pem.value" > ~/.ssh/k8s-the-hard-way`
- `chmod 400 ~/.ssh/k8s-the-hard-way`
- `EC2_IP=$(terraform output -json | jq -r ".jumpbox_public_ip.value")`
- `scp -i ~/.ssh/k8s-the-hard-way ~/.ssh/k8s-the-hard-way root@${EC2_IP}:~/.ssh/k8s-the-hard-way`
- `ssh root@${EC2_IP} -i ~/.ssh/k8s-the-hard-way`
- `sudo apt update`
- `sudo apt-get -y install wget curl vim openssl git`
- `encryption-configs.yaml`

# 05. Data Encryption Configuration

```console
cat > encryption-config.yaml <<EOF
kind: EncryptionConfig
apiVersion: v1
resources:
  - resources:
      - secrets
    providers:
      - aescbc:
          keys:
            - name: key1
              secret: ${ENCRYPTION_KEY}
      - identity: {}
EOF
```

## 07. bootstrapping-etcd

- `systemctl status etcd`

## 09. Bootstrapping the Kubernetes Workers

- `systemctl status kubelet.service`
- `systemctl status kube-proxy.service`
