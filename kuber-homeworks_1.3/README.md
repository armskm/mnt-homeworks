# Домашняя работа к занятию «Запуск приложений в K8S»

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod
Создал [файл deployment.yml](./app/deployment.yml)

Вывод с одной репликой:

<img width="555" height="154" alt="image" src="https://github.com/user-attachments/assets/6a4235af-8d88-4271-b665-f3a360873420" />

Массштабировал до 2-ух реплик:

<img width="574" height="178" alt="image" src="https://github.com/user-attachments/assets/68bae492-f932-4e50-bd23-ca3012edda7d" />

Создал [файл service.yml](./app/service.yml)

Создал [файл multitool-check.yml](./app/multitool-check.yml)

Проверил curl из пода в приложение из deployment:

<img width="1213" height="594" alt="image" src="https://github.com/user-attachments/assets/7276d039-3824-477a-9172-82782141c739" />


### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий




