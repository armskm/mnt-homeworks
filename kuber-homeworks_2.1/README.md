# Домашняя работа к занятию «Хранение в K8s»

## Задание 1. Volume: обмен данными между контейнерами в поде

[файл containers-data-exchange.yaml](./app/containers-data-exchange.yaml)

<img width="1302" height="1317" alt="image" src="https://github.com/user-attachments/assets/6bbd4e16-9f39-4cfd-95e5-7f0a0c78e455" />

<img width="786" height="418" alt="image" src="https://github.com/user-attachments/assets/178db8e5-35d4-4068-88d5-619130efeb2a" />

## Задание 2. PV, PVC

[файл pv-pvc.yaml](./app/pv-pvc.yaml)

Пункты 2,3:

<img width="812" height="717" alt="image" src="https://github.com/user-attachments/assets/f2d426a0-225d-45e7-9394-8bdee72f7df4" />


4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему. (Используйте команду `kubectl describe pv`).

<img width="1230" height="234" alt="image" src="https://github.com/user-attachments/assets/5a3b7718-6562-4711-b695-d7f4260102f8" />

<img width="556" height="388" alt="image" src="https://github.com/user-attachments/assets/08e3230b-8560-4980-9da2-62b866f58bba" />

PV не удалился, а перешёл в состояние Released, потому что в манифесте указано: persistentVolumeReclaimPolicy: Retain

5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV.  Продемонстрировать, что произошло с файлом после удаления PV. Пояснить, почему.

<img width="415" height="143" alt="image" src="https://github.com/user-attachments/assets/98d371e8-40ef-4037-9fe8-637df01e2f9b" />

Файл не удалился, потому что Type: HostPath

## Задание 3. StorageClass

[файл sc.yaml](./app/sc.yaml)
















