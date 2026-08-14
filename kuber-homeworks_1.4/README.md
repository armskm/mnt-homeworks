# Домашняя работа к занятию «Сетевое взаимодействие в Kubernetes»

## **Задание 1: Настройка Service (ClusterIP и NodePort)**

[файл deployment-multi-container.yaml](./app/deployment-multi-container.yaml)

[файл service-clusterip.yaml](./app/service-clusterip.yaml)

[файл service-nodeport.yaml](./app/service-nodeport.yaml)

<img width="1177" height="744" alt="image" src="https://github.com/user-attachments/assets/7bd9e335-ecc6-4929-83b1-d0bf123fa981" />

<img width="687" height="599" alt="image" src="https://github.com/user-attachments/assets/a02f6ef9-670c-4376-a5c1-437f08f4b991" />

## **Задание 2: Настройка Ingress**

[файл deployment-frontend.yaml](./app/deployment-frontend.yaml)

[файл deployment-backend.yaml](./app/deployment-backend.yaml)

[файл service-frontend.yaml](./app/service-frontend.yaml)

[файл service-backend.yaml](./app/service-backend.yaml)

[файл ingress.yaml](./app/ingress.yaml)

В моей версии MicroK8s v1.35.6 revision 9072 по дефолту устанавливает ingress traefic, поэтому решил вручную поставить nginx ingress командой:

```kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.0/deploy/static/provider/cloud/deploy.yaml```

Поэтому при curl пришлось учитывать порт, на котором работает контроллер ingress. Но суть такая же:

<img width="1118" height="520" alt="image" src="https://github.com/user-attachments/assets/57dc997b-3396-411e-ad2a-19b7a25003d8" />











