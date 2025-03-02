#!/bin/bash

# Запускаем SSH-сервер на фоне
/usr/sbin/sshd

# Бесконечный цикл для поддержания контейнера в рабочем состоянии
# Перезапуск SSH-сервера, если он завершится
while true; do
    if ! pgrep sshd > /dev/null; then
        echo "SSH server stopped, restarting..."
        /usr/sbin/sshd
    fi
    sleep 5
done