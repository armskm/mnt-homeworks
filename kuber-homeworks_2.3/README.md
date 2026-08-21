# Домашняя работа к занятию «Настройка приложений и управление доступом в Kubernetes»

## Задание 1. Работа с ConfigMaps

[файл deployment.yaml](./app/deployment.yaml)

[файл configmap-web.yaml](./app/configmap-web.yaml)

<img width="831" height="381" alt="image" src="https://github.com/user-attachments/assets/c2a31c5d-0bff-485c-ac90-1d4363991292" />

## **Задание 2: Настройка HTTPS с Secrets** 

[файл secret-tls.yaml](./app/secret-tls.yaml)

[файл ingress-tls.yaml](./app/ingress-tls.yaml)


<img width="549" height="287" alt="image" src="https://github.com/user-attachments/assets/bddb53a2-470d-44ef-a267-158fc60b0e2b" />


## **Задание 3: Настройка RBAC**

[файл srole-pod-reader.yaml](./app/role-pod-reader.yaml)

[файл rolebinding-developer.yaml](./app/rolebinding-developer.yaml)


```bash
microk8s enable rbac
openssl genrsa -out developer.key 2048
openssl req -new -key developer.key -out developer.csr -subj "/CN=user23"
openssl x509 -req -in developer.csr -CA /var/snap/microk8s/current/certs/ca.crt -CAkey /var/snap/microk8s/current/certs/ca.key -CAcreateserial -out developer.crt -days 365
microk8s kubectl config set-credentials user23 --client-certificate=developer.crt --client-key=developer.key --embed-certs=true
microk8s kubectl config set-context user23 --cluster=microk8s-cluster --user=user23
microk8s config > /root/.kube/config
```


















