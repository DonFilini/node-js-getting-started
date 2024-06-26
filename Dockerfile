# Используем официальный образ Node.js
FROM node:14

# Устанавливаем рабочую директорию
WORKDIR /usr/src/app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем остальные файлы проекта
COPY . .

# Сборка приложения
RUN npm run build

# Запуск тестов
RUN npm test

# Указываем команду для запуска приложения
CMD ["npm", "start"]

# Указываем порт, который будет использоваться приложением
EXPOSE 3000
