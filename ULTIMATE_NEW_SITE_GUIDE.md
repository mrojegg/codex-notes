# ULTIMATE NEW SITE GUIDE

Цель: по этому одному файлу запустить новый сайт как чистый, стабильный и поддерживаемый продукт.

## 0) Что считаем идеальным результатом
- Сайт работает по HTTPS на основном домене.
- `www` корректно редиректит на основной домен.
- Деплой полностью автоматический (через GitHub Actions).
- Любые правки вносятся безопасно (ветка -> проверка -> merge -> автодеплой).
- Есть короткий smoke-check после каждого релиза.

---

## 1) Старт нового проекта (обязательно)
1. Создать отдельную папку проекта.
2. Положить основной файл как `index.html`.
3. Инициализировать git и `main`.
4. Создать отдельный GitHub-репозиторий под этот сайт.

Команды:
```bash
git init -b main
git add .
git commit -m "Initial setup"
```

---

## 2) Настройка автодеплоя (GitHub Pages)
1. Добавить workflow деплоя (`.github/workflows/deploy-pages.yml`).
2. Запушить `main` в GitHub.
3. В репозитории: `Settings -> Pages -> Source: GitHub Actions`.
4. Вкладка `Actions`: убедиться, что workflow зелёный.

Если видите ошибку `Get Pages site failed ... Not Found`:
- Pages ещё не активирован, зайдите в `Settings -> Pages`, сохраните источник ещё раз и rerun jobs.

---

## 3) Подключение домена
### DNS для apex (`example.ru`)
Добавить 4 A-записи для `@`:
- 185.199.108.153
- 185.199.109.153
- 185.199.110.153
- 185.199.111.153

### DNS для `www`
- `CNAME www -> <username>.github.io`

### В GitHub Pages
1. `Settings -> Pages -> Custom domain` = ваш домен.
2. Дождаться `DNS check successful`.
3. Включить `Enforce HTTPS`.

---

## 4) CAA/SSL (если есть проблемы с сертификатом)
Добавить CAA на корень (`@`):
- `CAA 0 issue "letsencrypt.org"`
- `CAA 0 issue "digicert.com"`

Примечание: TXT записи верификации (например `_globalsign-domain-verification=...`) обычно допустимы и не мешают.

---

## 5) Безопасный процесс правок (жёсткое правило)
Любая правка только так:
1. Создать ветку: `feature/<name>`.
2. Внести изменения.
3. Локально проверить сайт.
4. Commit в ветке.
5. Merge в `main` только после проверки.
6. Публикация в прод — только из `main`.

Базовые команды:
```bash
git checkout -b feature/some-change
# edits
git add .
git commit -m "Update"
git checkout main
git merge feature/some-change
git push
```

---

## 6) Обязательный smoke-check после каждого релиза
Проверить вручную:
1. `https://<domain>` открывается.
2. `https://www.<domain>` редиректит на основной.
3. HTTPS активен.
4. Работают меню/модалки/кликабельные элементы.
5. Работают email-ссылки (`mailto` + fallback, если предусмотрено).
6. На мобильных всё кликабельно и читаемо.

---

## 7) Частые ошибки и быстрые фиксы
1. `DNS check unsuccessful`:
- DNS ещё не применился или зона/NS неверные.
- Проверить NS и A/CNAME, подождать 15-60 мин (иногда до 24-48 ч), нажать `Check again`.

2. `404 There isn't a GitHub Pages site here`:
- Pages не включен или деплой не прошёл.
- Включить Pages source на GitHub Actions и rerun workflow.

3. Push ошибка `workflow scope`:
- PAT без `workflow` scope не может пушить workflow-файлы.
- Нужен токен с `repo` + `workflow`.

4. Push ошибка `Invalid username or token`:
- Токен неверный/истёк.
- Выпустить новый PAT.

5. На iPhone сайт открыт как файл (`file://`) и часть действий не работает:
- Открывать сайт только через `http(s)`.

---

## 8) Безопасность (обязательно)
1. Никогда не хранить PAT в `git remote`.
2. Любой токен, попавший в чат/логи, сразу считать скомпрометированным и отзывать.
3. Использовать минимальные scope токена.
4. Держать в репозитории только то, что нужно прод-сайту.

Команда очистки remote после push с токеном:
```bash
git remote set-url origin https://github.com/<user>/<repo>.git
```

---

## 9) Что хранить в repo сайта, а что в repo знаний
В repo сайта хранить только прод-артефакты:
- `index.html`
- `CNAME` (если нужен)
- `.github/workflows/deploy-pages.yml`
- минимум технических файлов

В repo знаний (`codex-notes`) хранить:
- чеклисты,
- playbook,
- postmortem/ошибки,
- процессы и шаблоны.

---

## 10) Definition of Done (проект завершён)
Проект завершён, когда:
1. домен и HTTPS работают,
2. деплой автоматический и стабилен,
3. smoke-check проходит,
4. процесс правок безопасный и повторяемый,
5. документация для восстановления контекста существует.
