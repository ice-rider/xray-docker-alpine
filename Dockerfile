FROM alpine:latest

# Устанавливаем необходимые пакеты: ca-certificates (для HTTPS), unzip (для распаковки)
RUN apk add --no-cache ca-certificates unzip

# Определяем версию Xray (можно взять последнюю с https://github.com/XTLS/Xray-core/releases)
ENV XRAY_VERSION="26.3.27"

# Скачиваем и распаковываем Xray
ADD https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip /tmp/xray.zip
RUN unzip /tmp/xray.zip -d /usr/local/bin && \
    rm /tmp/xray.zip && \
    chmod +x /usr/local/bin/xray

# Копируем конфигурацию
COPY config.json /etc/xray/config.json

# Xray работает по умолчанию от непривилегированного пользователя, но в контейнере лучше не переключать
# Если хотите, создайте пользователя xray, но это опционально.

EXPOSE 443

CMD ["xray", "-c", "/etc/xray/config.json"]
