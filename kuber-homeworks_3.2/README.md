# Домашнее задание к занятию «Установка Kubernetes»

### Задание 1. Установить кластер k8s с 1 master node

1. Подготовка работы кластера из 5 нод: 1 мастер и 4 рабочие ноды.
2. В качестве CRI — containerd.
3. Запуск etcd производить на мастере.
4. Способ установки выбрать самостоятельно.

## Ответ

1. Подготовка работы кластера из 5 нод: 1 мастер и 4 рабочие ноды.

- Подготавливаю инфраструктуру через terraform.

Инфраструктура описана в манифестах

[main.tf](./src/main.tf)
[variables.tf](./src/variables.tf)
[outputs.tf](./src/outputs.tf)



```bash
# Шпаргалка
# Выпуск нового токена для сервисной учетки
yc iam service-account list
yc iam create-token --impersonate-service-account-id 

# Развернуть описанную инфраструктуру
terraform init
terraform validate
terraform plan
terraform apply
```

<img width="975" height="346" alt="image" src="https://github.com/user-attachments/assets/535541cd-d577-4f77-bda1-a770c0b784ac" />

<img width="673" height="622" alt="image" src="https://github.com/user-attachments/assets/eb59cf83-b80d-4c89-8670-6df9cf9463b2" />

