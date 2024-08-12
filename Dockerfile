# Menggunakan base image Node.js versi 14
FROM node:14

# Menentukan working directory di dalam container sebagai /app
WORKDIR /app

# Menyalin seluruh source code dari mesin host ke working directory di dalam container
COPY . /app

# Menentukan bahwa aplikasi berjalan dalam production mode dan menggunakan item-db sebagai database host
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Menginstal dependencies untuk production dan kemudian build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port 8080 untuk aplikasi
EXPOSE 8080

# Saat container diluncurkan, jalankan server dengan perintah npm start
CMD ["npm", "start"]
