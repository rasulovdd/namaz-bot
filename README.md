<p align="center">
<img src = "https://github.com/rasulovdd/namaz-bot/blob/main/data/photo_1.jpg?raw=true" width = 50%>
</p>

<div align = "center">

[![GitHub](https://img.shields.io/github/license/rasulovdd/namaz-bot)](https://github.com/rasulovdd/namaz-bot/blob/main/LICENSE) 
[![Telegram](https://img.shields.io/badge/telegram-blue?logo=telegram)](https://t.me/namazztime_bot)<br/>
[![!Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)
[![!Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![!MongoDB](https://img.shields.io/badge/MongoDB-Blue?style=for-the-badge&logo=mongodb&logoColor=white)](https://www.mongodb.com/)
[![!Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://telegram.org/)

</div>

<h1 align="center">Время Намаза Bot</h1>

## Описание

Это очень простой бот-уведомитель, который напоминает вам о необходимости молиться примерно во время
молитвы. Бот работает во всех часовых поясах и также может отслеживать молитвы.

## Источники:
Чтобы узнать время молитвы, [этот API](https://aladhan.com/prayer-times-api)<br/>
Чтобы получить дату хиджры, [этот пакет](https://hijri-converter.readthedocs.io/en/stable/index.html).

## Стек
Core: python 3, aiogram, hijri-converter<br/>
Database: MongoDB<br/>

## Установка

1. Скачайте репозиторий<br/>

    ```bash
    git clone https://github.com/rasulovdd/namaz-bot.git && cd namaz-bot
    ```

2. Устанавливаем виртуальное окружение<br/>

    ```bash
    apt install -y python3-venv
    ```
    ```bash
    python3 -m venv env
    ```

3. Активируем её <br/>

    ```bash
    source env/bin/activate
    ```

4. Скачиваем и устанавливаем нужные библиотеки<br/>

    ```bash
    pip install -r requirements.txt
    ```

5. Изменить в скрипте mongodb-setup.sh следующие параметры: <br/>
    
    Пользователь: bot_user
    Пароль: password1!
    База данных: namaz_bot

6. Запустить скрипт mongodb-setup.sh<br/>
    даем права 
    ```bash
    chmod +x mongodb-setup.sh
    ```
    запускаем скрипт
    ```bash
    ~/mongodb-setup.sh
    ```

7. Создаем .env файл с вашими данными, можно создать из шаблона и просто поправить поля <br/>

    ```bash
    cp .env.example .env
    nano .env
    ```

8. Создаем .service файл для вашего бота 
    sudo nano /etc/systemd/system/namaz-bot.service<br/>

    ```ini
    [Unit]
    Description='Service for namaz-bot'
    After=network.target

    [Service]
    Type=idle
    Restart=on-failure
    StartLimitBurst=2
    # Restart, but not more than once every 30s (for testing purposes)
    StartLimitInterval=120
    User=root
    ExecStart=/bin/bash -c 'cd ~/namaz-bot/ && source env/bin/activate && python3 app.py'

    [Install]
    WantedBy=multi-user.target

    ```

9. Включаем сервис и запускаем<br/>

    ```bash
    systemctl enable namaz-bot.service
    systemctl start namaz-bot.service
    ```

10. Бот готов к использованию 

## пример заполнения .env файла:
    # ID администратора
    ADMIN="2964812"
    BOT_TOKEN="Токен бота"
    # имя пользователя БД
    DB_USER="bot_user"
    # пароль пользователя БД
    DB_PASSWORD="password1!"
    # Адрес базы данных
    DB_HOST="127.0.0.1"