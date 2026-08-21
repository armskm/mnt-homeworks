# Домашняя работа к занятию «Helm»

### Задание 1. Подготовить Helm-чарт для приложения

```bash
# создал чарт
helm create nginx
```

Очистил папку templates и создал свой файл deployment

[файл deployment.yaml](./nginx/templates/deployment.yaml)

Очистил содержимое файла values.yaml и внёс в него свои переменные

[файл values.yaml](./nginx/values.yaml)

### Задание 2. Запустить две версии в разных неймспейсах

```bash
# проверка линтером
helm lint nginx

# создаю немспейсы app1 app2
kubectl create namespace app1
kubectl create namespace app2

# запускаю приложения
helm install nginx24-1 . --namespace=app1
helm install nginx24-2 . --namespace=app1 --set image.tag=latest --set deployment.label=nginx24-2
helm install nginx24-3 . --namespace=app2 --set image.tag=1.24

# смотрю результат
kubectl get po -A
```
<img width="1198" height="823" alt="image" src="https://github.com/user-attachments/assets/21aeadd4-48e3-463c-9e95-abb038f88e83" />

















