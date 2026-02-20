# NEW PROJECT CHECKLIST (Site)

## 1) Старт проекта
- Создать отдельную папку проекта
- Основной файл сайта: `index.html`
- Отдельный GitHub-репозиторий под каждый сайт

## 2) Безопасный процесс правок
- Создавать ветку от `main`: `feature/...`
- Вносить правки и проверять локально
- Commit в ветке
- Merge в `main` только после проверки
- Деплой в прод только из `main`

## 3) Git базово
```bash
git init -b main
git add .
git commit -m "Initial setup"
```

## 4) GitHub + автодеплой
- Пуш в GitHub-репозиторий
- В `Settings -> Pages` выбрать `Source: GitHub Actions`
- Проверить workflow в `Actions`

## 5) Домен и DNS (GitHub Pages)
- A-записи для `@`:
  - 185.199.108.153
  - 185.199.109.153
  - 185.199.110.153
  - 185.199.111.153
- CNAME для `www` -> `<username>.github.io`
- В GitHub Pages задать `Custom domain`
- После проверки DNS включить `Enforce HTTPS`

## 6) Типовые ошибки
- `DNS check unsuccessful`: DNS не применился/не делегирован
- `404 There isn't a GitHub Pages site here`: Pages не включен или деплой не прошел

## 7) Smoke-check после каждого релиза
- Открывается основной домен
- Открывается `www` (редирект)
- Работают модалки/клики
- Работает email-ссылка
- Работает мобильная версия

## 8) Обновление сайта
```bash
git add index.html
git commit -m "Update site"
git push
```
