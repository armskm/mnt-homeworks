# Домашнее задание к занятию 6 «Создание собственных модулей»

Cсылки на [collection](https://github.com/armskm/my_own_collection/tree/1.0.0) и на [tar.gz архив](https://github.com/armskm/my_own_collection/blob/1.0.0/my_own_namespace-yandex_cloud_elk-1.0.0.tar.gz)

**Шаг 4.** Проверьте module на исполняемость локально.
```
python -m ansible.modules.my_own_module playload.json
```
<img width="1346" height="56" alt="ans-mod-4" src="https://github.com/user-attachments/assets/d59ea203-3917-478a-99db-b6d230f9641e" />

**Шаг 6.** Проверьте через playbook на идемпотентность.
```
ansible-playbook single_playbook.yml
```
<img width="1345" height="470" alt="ans-mod-6" src="https://github.com/user-attachments/assets/489aca61-873b-4dc9-8183-d68a494ddddb" />

**Шаг 15.** Установите collection из локального архива: `ansible-galaxy collection install <archivename>.tar.gz`.
<img width="949" height="74" alt="ans-mod-15" src="https://github.com/user-attachments/assets/f924478d-8f04-41f7-a78b-3560834026c7" />

**Шаг 16.** Запустите playbook, убедитесь, что он работает.
<img width="1012" height="200" alt="ans-mod-16" src="https://github.com/user-attachments/assets/a3052962-163e-412a-ba69-bc3325131ecc" />









