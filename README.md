# 📦 xray-docker-alpine

Минималистичный Docker-образ для [**Xray-core**](https://github.com/XTLS/Xray-core) на базе **Alpine Linux**.

## Особенности

- 🪶 Лёгкий образ на базе Alpine (минимальный размер)
- 🔒 Автоматическая сборка через GitHub Actions
- 🚀 Готов к запуску с кастомной конфигурацией

## Требования

- **Собственный файл `config.json`** — необходим для работы Xray (в репозитории отсутствует)

## Использование

### Docker

```bash
docker run -d \
  -p 443:443 \
  -v $(pwd)/config.json:/etc/xray/config.json \
  ghcr.io/ice-rider/xray-docker-alpine:latest
```

### Docker Compose

```yaml
version: '3.8'

services:
  xray:
    image: ghcr.io/ice-rider/xray-docker-alpine:latest
    container_name: xray
    ports:
      - "443:443"
    volumes:
      - ./config.json:/etc/xray/config.json
    restart: unless-stopped
```

## Лицензия

[MIT](./LICENSE)

## Ссылки

- [Официальный репозиторий Xray-core (XTLS)](https://github.com/XTLS/Xray-core)
- [Документация Xray](https://xtls.github.io/)
