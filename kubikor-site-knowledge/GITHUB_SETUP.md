# GitHub + автодеплой (GitHub Pages)

## 1) Создать репозиторий на GitHub
- Создайте пустой репозиторий, например: `kubikor-site`

## 2) Привязать локальный проект и отправить код
```bash
cd "/Users/papoyan.a/Downloads/Reddy/site-project"
git remote add origin https://github.com/<YOUR_USERNAME>/kubikor-site.git
git push -u origin main
```

## 3) Включить Pages
- GitHub -> Repo -> Settings -> Pages
- Source: `GitHub Actions`

После этого каждый `git push` в `main` автоматически публикует сайт.

## 4) Подключить домен
- Settings -> Pages -> Custom domain -> введите ваш домен
- В DNS у регистратора:
  - Для apex-домена (`example.ru`) добавить A-записи на GitHub Pages IP
  - Для `www` добавить CNAME на `<YOUR_USERNAME>.github.io`

## 5) Как обновлять сайт дальше
```bash
cd "/Users/papoyan.a/Downloads/Reddy/site-project"
# правите index.html

git add index.html
git commit -m "Update site"
git push
```
