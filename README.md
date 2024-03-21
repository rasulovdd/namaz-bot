[![GitHub](https://img.shields.io/github/license/rasulovdd/namaz-bot)](https://github.com/rasulovdd/namaz-bot/blob/main/LICENSE) [![Telegram](https://img.shields.io/badge/telegram-%40namaz-bot-blue)](https://t.me/namazztime_bot)

<h1 align="center">Время Намаза Bot</h1>

## Описание

Это очень простой бот-уведомитель, который напоминает вам о необходимости молиться примерно во время
молитвы. Бот работает во всех часовых поясах и также может отслеживать молитвы.

## Источники:
Чтобы узнать время молитвы, [this API](https://aladhan.com/prayer-times-api)
Чтобы получить дату хиджры, [this package](https://hijri-converter.readthedocs.io/en/stable/index.html) is used.

## Стек
Core: python 3, aiogram<br/>
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

5. Создаем .env файл с вашими данными, можно создать из шаблона и просто поправить поля <br/>

    ```bash
    cp .env.example .env
    nano .env
    ```

6. Создаем .service файл для вашего бота 
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

7. Включаем сервис и запускаем<br/>

    ```bash
    systemctl enable namaz-bot.service
    systemctl start namaz-bot.service
    ```

8. Бот готов к использованию 

## пример заполнения .env файла:
    # ID администратора
    ADMIN=
    BOT_TOKEN="Токен бота"
    # имя пользователя БД
    DB_USER=
    # пароль пользователя БД
    DB_PASSWORD=
    # Адрес базы данных
    DB_HOST=

    bot_tokken="Токен бота"
    api_tokken="токен доступа к BotAPI"
    #Адрес базы данных
    db_host="127.0.0.1"
    #имя пользователя БД
    db_user="bot_user" 
    #пароль пользователя БД
    db_password="bot_password1!"
    #название БД
    database="taxi_calls_bot"
    #адрес сервера где будет работать BotAPI
    my_host="10.10.1.111"
    #порт сервера где будет работать BotAPI
    my_port="5010" 
    #список пользователей для уведомления
    users_id="2964812"
    #список пользователей c правами администратора
    admins_id="2964812"
    #статус debug режима
    debug_on=1 