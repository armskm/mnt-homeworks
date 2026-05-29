# Домашнее задание к занятию 5 «Тестирование roles»
### Molecule
1. `molecule test -s ubuntu_xenial`
   <img width="940" height="536" alt="ans-test01" src="https://github.com/user-attachments/assets/1342e9a5-f6c7-4d7e-b3b5-5cb7d0f505a7" />
   <img width="927" height="617" alt="ans-test01-1" src="https://github.com/user-attachments/assets/22a10429-67c7-448f-8ad5-42cac30ffdce" />

2. `molecule init scenario --driver-name docker`
   <img width="990" height="485" alt="ans-test02" src="https://github.com/user-attachments/assets/d5462b98-c67a-4c5e-a1b9-589568df5b09" />

3. Добавьте несколько разных дистрибутивов (oraclelinux:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.
   <img width="936" height="1025" alt="ans-test03" src="https://github.com/user-attachments/assets/6465f01f-e35f-4356-972c-0db929cd8b60" />

4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.).
   <img width="933" height="543" alt="ans-test04" src="https://github.com/user-attachments/assets/1d740db5-b6bd-4bf5-b60f-ee056543e102" />

5. [Ссылка на тег](https://github.com/armskm/vector-role/tree/1.1.0)


### Tox

[Ссылка на тег](https://github.com/armskm/vector-role/tree/1.1.1)

<img width="1329" height="919" alt="ans-test01-tox" src="https://github.com/user-attachments/assets/7a649f20-7374-4e7f-b9dc-faf2205f0655" />




