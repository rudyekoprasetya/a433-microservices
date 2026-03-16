# 1. Menggunakan base image Node.js versi 14
FROM node:14

# 2. Menentukan working directory untuk container
WORKDIR /app

# 3. Menyalin seluruh source code dari folder lokal ke working directory di container
# kita menyalin isinya ke direktori aktif (.)
COPY . .

# 4. Menentukan environment variable untuk production mode dan database host
ENV NODE_ENV=production DB_HOST=item-db

# 5. Menginstal dependencies untuk production dan melakukan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# 6. Ekspos port 8080 agar bisa diakses dari luar container
EXPOSE 8080

# 7. Menjalankan aplikasi menggunakan perintah npm start saat container diluncurkan
CMD ["npm", "start"]