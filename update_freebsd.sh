#!/bin/sh

# Обновление системы FreeBSD

# Убедитесь, что скрипт запущен с правами суперпользователя
if [ "$EUID" -ne 0 ]; then
    echo "Пожалуйста, запустите этот скрипт с правами суперпользователя (root)."
    exit 1
fi

# Обновляем список пакетов
echo "Обновление списка пакетов..."
pkg update

# Устанавливаем обновления пакетов
echo "Установка обновлений пакетов..."
pkg upgrade -y

# Обновляем систему
echo "Обновление системы..."
freebsd-update fetch
freebsd-update install

# Удаляем старые пакеты
echo "Очистка старых пакетов..."
pkg autoremove -y

# Очистка кеша пакетов
echo "Очистка кеша пакетов..."
pkg clean -y

echo "Обновление завершено!"
