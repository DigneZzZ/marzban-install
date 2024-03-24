#!/bin/bash

# Вывод заголовка
echo '  
██╗   ███╗ █████╗ ██████╗ ███████╗██████╗  █████╗ ███╗   ██╗
████╗ ████║██╔══██╗██╔══██╗╚══███╔╝██╔══██╗██╔══██╗████╗  ██║
██╔████╔██║███████║██████╔╝  ███╔╝ ██████╔╝███████║██╔██╗ ██║
██║╚██╔╝██║██╔══██║██╔══██╗ ███╔╝  ██╔══██╗██╔══██║██║╚██╗██║
██║ ╚═╝ ██║██║  ██║██║  ██║███████╗██████╔╝██║  ██║██║ ╚████║
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝

 █████╗ ███╗   ██╗██████╗ 
██╔══██╗████╗  ██║██╔══██╗
███████║██╔██╗ ██║██║  ██║
██╔══██║██║╚██╗██║██║  ██║
██║  ██║██║ ╚████║██████╔╝
╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 

██╗  ██╗ █████╗ ██████╗ ██████╗  ██████╗ ██╗  ██╗██╗   ██╗
██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔═══██╗╚██╗██╔╝╚██╗ ██╔╝
███████║███████║██████╔╝██████╔╝██║   ██║ ╚███╔╝  ╚████╔╝ 
██╔══██║██╔══██║██╔═══╝ ██╔══██╗██║   ██║ ██╔██╗   ╚██╔╝  
██║  ██║██║  ██║██║     ██║  ██║╚██████╔╝██╔╝ ██╗   ██║   
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
                                                                                                                                    
                                                                                                
██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
                                                                      
                                                                                          

██████╗ ██╗   ██╗    ██████╗ ██╗ ██████╗ ███╗   ██╗███████╗███████╗███████╗███████╗    
██╔══██╗╚██╗ ██╔╝    ██╔══██╗██║██╔════╝ ████╗  ██║██╔════╝╚══███╔╝╚══███╔╝╚══███╔╝    
██████╔╝ ╚████╔╝     ██║  ██║██║██║  ███╗██╔██╗ ██║█████╗    ███╔╝   ███╔╝   ███╔╝     
██╔══██╗  ╚██╔╝      ██║  ██║██║██║   ██║██║╚██╗██║██╔══╝   ███╔╝   ███╔╝   ███╔╝      
██████╔╝   ██║       ██████╔╝██║╚██████╔╝██║ ╚████║███████╗███████╗███████╗███████╗    
╚═════╝    ╚═╝       ╚═════╝ ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝╚══════╝    
                                                                                                                                                                                               
'
echo -e "\e[1m\e[33|Our community: https://openode.xyz\n\e[0m"
sleep 2s
# Function to update repositories
# Функция для обновления репозиториев
update_repositories() {
    sudo apt update && sudo apt upgrade -yqq
}
# Function to install necessary packages
# Функция для установки необходимых пакетов
install_packages() {
    sudo apt install -yqq git nano wget haproxy
}
# Function to install Marzban
# Функция для установки Marzban
install_marzban_haproxy() {
    echo "Сейчас будет установлен Marzban / Marzban installation will begin now."

    # Установка Marzban
    sudo bash -c "$(curl -sL https://raw.githubusercontent.com/DigneZzZ/marzban-install/main/install.sh)" @ install

    echo "Установка завершена. / Installation completed."


}

# Функция для остановки Marzban
stop_marzban_haproxy() {
    echo "Остановка Marzban ... Stopping Marzban"

    # Остановка Marzban
    marzban down

    echo "Marzban остановлен. Marzban Stopped"
}

# Функция для изменения файла docker-compose.yml
change_docker_compose() {
    echo "Изменение файла docker-compose.yml..."

    # Путь к файлу docker-compose.yml
    docker_compose_file="/opt/marzban/docker-compose.yml"

    # Проверка наличия файла docker-compose.yml
    if [ ! -f "$docker_compose_file" ]; then
        echo "Ошибка! Файл docker-compose.yml не найден."
        return 1
    fi

    # Создание резервной копии файла docker-compose.yml
    sudo cp "$docker_compose_file" "$docker_compose_file.bak"

    # Замена содержимого файла docker-compose.yml
    sudo cat > "$docker_compose_file" <<EOF

services:
  marzban:
    image: gozargah/marzban:latest
    restart: always
    env_file: .env
    volumes:
      - /var/lib/marzban:/var/lib/marzban

EOF

    echo "Файл docker-compose.yml изменен."
}

# Функция для изменения файла .env
change_env_file() {
    echo "Изменение файла .env..."

    # Запрос пользователю ввода переменных
    read -rp "Введите SUB_PROFILE_TITLE: " SUB_PROFILE_TITLE
    read -rp "Введите SUB_SUPPORT_URL: " SUB_SUPPORT_URL

# Проверка ввода XRAY_SUBSCRIPTION_URL_PREFIX
while true; do
    read -rp "Введите XRAY_SUBSCRIPTION_URL_PREFIX (только английские буквы, цифры и допустимые символы): " XRAY_SUBSCRIPTION_URL_PREFIX
    if [[ $XRAY_SUBSCRIPTION_URL_PREFIX =~ ^https://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        break
    else
        echo "Ошибка! Вводите только английские буквы, цифры и допустимые символы."
    fi
done

# Проверка ввода домена для адреса PANEL
while true; do
    read -rp "Введите домен для адреса PANEL: " YOUR_PANEL_DOMAIN
    # Проверка наличия префикса https://
    if [[ ! $YOUR_PANEL_DOMAIN =~ ^https:// ]]; then
        # Добавление префикса https:// к введенному значению
        YOUR_PANEL_DOMAIN="https://$YOUR_PANEL_DOMAIN"
    fi
    # Проверка корректности введенного домена
    if [[ $YOUR_PANEL_DOMAIN =~ ^https://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        break
    else
        echo "Ошибка! Введите корректный домен без префикса https://."
    fi
done

    # Заполнение файла .env
    cat > /opt/marzban/.env <<EOF
UVICORN_HOST="127.0.0.1"
UVICORN_PORT=10000
TZ=Europe/Moscow
UVICORN_SSL_CERTFILE="/var/lib/marzban/certs/fullchain.pem"
UVICORN_SSL_KEYFILE="/var/lib/marzban/certs/key.pem"
XRAY_JSON="/var/lib/marzban/xray_config.json"
XRAY_SUBSCRIPTION_URL_PREFIX="$XRAY_SUBSCRIPTION_URL_PREFIX"
SQLALCHEMY_DATABASE_URL="sqlite:////var/lib/marzban/db.sqlite3"
CUSTOM_TEMPLATES_DIRECTORY="/var/lib/marzban/templates/"
SUBSCRIPTION_PAGE_TEMPLATE="subscription/index.html"
SUB_PROFILE_TITLE="$SUB_PROFILE_TITLE"
SUB_SUPPORT_URL="$SUB_SUPPORT_URL"
SUB_UPDATE_INTERVAL="1"
EOF

    echo "Файл .env изменен."
}

# Функция для создания\редактирования файла haproxy.cfg
create_haproxy_config() {
    echo "Создание файла haproxy.cfg..."

    # Путь к файлу haproxy.cfg
    haproxy_cfg_path="/etc/haproxy/haproxy.cfg"

    # Заполнение файла haproxy.cfg
    cat > "$haproxy_cfg_path" <<EOF

global
    log /dev/log    local0
    log /dev/log    local1 notice
    chroot /var/lib/haproxy
    stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
    stats timeout 30s
    user haproxy
    group haproxy
    daemon
    ca-base /var/lib/marzban/certs/fullchain.pem
    crt-base /var/lib/marzban/certs/key.pem
    ssl-default-bind-ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305>
    ssl-default-bind-ciphersuites TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256
    ssl-default-bind-options ssl-min-ver TLSv1.2 no-tls-tickets

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    timeout connect 5000
    timeout client  50000
    timeout server  50000
    errorfile 400 /etc/haproxy/errors/400.http
    errorfile 403 /etc/haproxy/errors/403.http
    errorfile 408 /etc/haproxy/errors/408.http
    errorfile 500 /etc/haproxy/errors/500.http
    errorfile 502 /etc/haproxy/errors/502.http
    errorfile 503 /etc/haproxy/errors/503.http
    errorfile 504 /etc/haproxy/errors/504.http

listen front
    mode tcp
    bind *:443

    tcp-request inspect-delay 5s
    tcp-request content accept if { req_ssl_hello_type 1 }

    use_backend panel if { req.ssl_sni -m end $YOUR_PANEL_DOMAIN }
    use_backend sub if { req.ssl_sni -i end  $YOUR_PANEL_DOMAIN }
    use_backend reality if { req.ssl_sni -m end discordapp.com }
    default_backend reality

backend panel
    mode tcp
    server srv1 127.0.0.1:10000

backend sub
    mode tcp
    server srv1 127.0.0.1:10000

backend reality
    mode tcp
    server srv1 127.0.0.1:12000 send-proxy

EOF

systemctl restart haproxy
    echo "Файл haproxy.cfg создан."
}

# Функция для создания директорий
create_directories() {
    echo "Создание директорий..."

    # Создание директорий
    sudo mkdir -p /var/lib/marzban/certs/
    sudo mkdir -p /var/lib/marzban/xray-core/xray/
}
# Функция для установки необходимых пакетов для работы с сертификатами
install_certificates_packages() {
    sudo apt install -y cron socat
}

# Функция для установки и настройки сертификатов Let's Encrypt
setup_ssl_certificates() {
    echo "Настройка SSL-сертификатов..."

    # Запрос пользователю ввода email для регистрации сертификата Let's Encrypt
    read -rp "Введите ваш email для регистрации SSL-сертификата Let's Encrypt (либо нажмите Enter для генерации случайного): " email
    # Проверка корректности введенного email
    if [[ ! "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Введенный email некорректен. Будет сгенерирован случайный email."
        email="user-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10)@gmail.com"
        echo "Сгенерированный email: $email"
    fi

    # Установка acme.sh и запрос SSL-сертификата
    curl https://get.acme.sh | sh -s email="$email"
    ~/.acme.sh/acme.sh --set-default-ca --server letsencrypt --issue --standalone -d "$YOUR_PANEL_DOMAIN" \
    --key-file /var/lib/marzban/certs/key.pem \
    --fullchain-file /var/lib/marzban/certs/fullchain.pem

    echo "SSL-сертификаты настроены."

}
update_xray_config() {
    echo "Обновление файла xray_config.json..."

    # Создание дампа файла
    sudo cp /var/lib/marzban/xray_config.json /var/lib/marzban/xray_config.json.bak

    # Генерация privateKey
    private_key=$(docker exec marzban-marzban-1 xray x25519)

    # Генерация 15 shortID
    short_ids=""
    for ((i = 0; i < 15; i++)); do
        short_id=$(openssl rand -hex 8)
        short_ids+="\"$short_id\","
    done
    # Удаление последней запятой
    short_ids="${short_ids%,}"

    # Замена содержимого файла xray_config.json
    cat > /var/lib/marzban/xray_config.json <<EOF
{
    "log": {
      "loglevel": "warning"
    },
    "inbounds": [
      {
        "tag": "VLESS TCP REALITY",
        "listen": "127.0.0.1",
        "port": 12000,
        "protocol": "vless",
        "settings": {
          "clients": [],
          "decryption": "none"
        },
        "streamSettings": {
          "network": "tcp",
          "tcpSettings": {
          "acceptProxyProtocol": true
          },
          "security": "reality",
          "realitySettings": {
            "show": false,
            "dest": "discordapp.com:443",
            "xver": 0,
            "serverNames": [
              "cdn.discordapp.com",
              "discordapp.com"
            ],
            "privateKey": "$private_key",
            "shortIds": [
              $short_ids
            ]
          }
        },
        "sniffing": {
          "enabled": true,
          "destOverride": [
            "http",
            "tls"
          ]
        }
      }
    ],
    "outbounds": [
      {
        "protocol": "freedom",
        "tag": "DIRECT"
      },
      {
        "protocol": "blackhole",
        "tag": "BLOCK"
      }
    ],
    "routing": {
      "domainStrategy": "IPIfNonMatch",
      "rules": [
        
        {
            "ip": [
                "geoip:private"
            ],
            "outboundTag": "BLOCK",
            "type": "field"
        },
        {
            "domain": [
                "geosite:private"
            ],
            "outboundTag": "BLOCK",
            "type": "field"
        },
        {
            "protocol": [
                "bittorrent"
            ],
            "outboundTag": "BLOCK",
            "type": "field"
        }
      ]
    }
}
EOF

    echo "Файл xray_config.json обновлен."
}
update_marzban() {
    echo "Обновление Marzban..."

    # Запуск команды обновления Marzban
    marzban restart -n

    echo "Marzban обновлен."
}
# Основная функция, которая вызывает остальные функции
main() {
    update_repositories
    install_packages
    install_marzban_haproxy
    stop_marzban_haproxy
    change_docker_compose
    change_env_file
    create_haproxy_config
    create_directories
    install_certificates_packages
    setup_ssl_certificates
    update_marzban
    update_xray_config
    
}

# Вызов основной функции
main
