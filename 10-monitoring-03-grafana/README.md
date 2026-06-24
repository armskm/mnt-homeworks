# Домашнее задание к занятию 14 «Средство визуализации Grafana»

### Задание 1

<img width="1788" height="482" alt="image" src="https://github.com/user-attachments/assets/7977d60a-b54d-414d-9e94-278676845e40" />

### Задание 2

- утилизация CPU для nodeexporter (в процентах, 100-idle);

```bash
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[1m])) * 100)
```

- CPULA 1/5/15;

```bash
node_load1
node_load5
node_load15
```

- количество свободной оперативной памяти;

```bash
node_memory_MemAvailable_bytes
```

- количество места на файловой системе.

```bash
node_filesystem_free_bytes{fstype="ext4"}
```

<img width="2135" height="726" alt="image" src="https://github.com/user-attachments/assets/dff0b388-faa4-4178-8a40-1f5c797fa7b1" />


### Задание 3

<img width="2085" height="681" alt="image" src="https://github.com/user-attachments/assets/7833f33c-a6ef-4b95-87fc-71c4e78ffbb3" />
