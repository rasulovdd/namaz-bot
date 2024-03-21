# Обновление системы
sudo apt-get update

# Установка MongoDB
sudo apt-get install mongodb -y

# Запуск MongoDB
sudo service mongodb start

# Ожидание запуска MongoDB
sleep 5

# Создание пользователя и пароля
mongo bot_user --eval "db.createUser({user: 'bot_user', pwd: 'password1!', roles:[{role:'userbot_userAnyDatabase', db:'bot_user'},{role:'readWrite', db:'namaz_bot'}]})"

# Вход в MongoDB с созданным пользователем и паролем
mongo -u bot_user -p password1! --authenticationDatabase bot_user --eval "use namaz_bot"

# Создание коллекции users
mongo namaz_bot --eval "db.createCollection('users')"

# Вывод информации об установке
echo "Установка MongoDB, создание пользователя и пароля, базы данных и коллекции завершены"
echo "Пользователь: bot_user"
echo "Пароль: password1!"
echo "База данных: namaz_bot"
echo "Таблицы: users"
```