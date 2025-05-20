FROM swipl

# Копирай всички файлове в /app
COPY . /app
WORKDIR /app

# Стартирай Prolog сървъра при стартиране на контейнера
CMD ["swipl", "-s", "server.pl", "-g", "main", "-t", "halt"]
