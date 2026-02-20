# DOMAIN CHECKLIST (qubycore.ru)

## Текущее состояние (на 20 Feb 2026)
- Репозиторий: `https://github.com/mrojegg/kubikormsk-site`
- GitHub Pages workflow добавлен и запушен в `main`.
- DNS записи в REG.RU заведены корректные (A @ x4 + CNAME www).
- Снаружи DNS пока не резолвится (пропагация/делегирование еще не завершены).

## Чеклист завершения подключения домена
1. В REG.RU выбрать DNS-серверы: `ns1.reg.ru` и `ns2.reg.ru`.
2. Убедиться, что в DNS-зоне есть записи:
   - `A` `@` -> `185.199.108.153`
   - `A` `@` -> `185.199.109.153`
   - `A` `@` -> `185.199.110.153`
   - `A` `@` -> `185.199.111.153`
   - `CNAME` `www` -> `mrojegg.github.io`
3. Сохранить/применить зону в REG.RU.
4. Проверить, что статус домена в REG.RU: `Активен`/`Делегирован`.
5. В GitHub -> `Settings -> Pages`:
   - `Source: GitHub Actions`
   - `Custom domain: qubycore.ru`
   - Нажать `Check again`.
6. После успешной DNS-проверки включить `Enforce HTTPS`.
7. Проверить открытие:
   - `https://qubycore.ru`
   - `https://www.qubycore.ru`

## Если DNS check unsuccessful
- Подождать 15-60 минут, иногда до 24 часов.
- Проверить, что нет конфликтующих записей для `@` и `www`.
- Повторить `Check again` в GitHub Pages.

## Безопасность
- Все токены GitHub, которые отправлялись в чат, отозвать.
- Для дальнейшей работы использовать новый PAT с нужными правами (`repo`, `workflow`) только при необходимости.
