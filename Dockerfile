# File Dockerfile untuk Shipping Service (menggunakan Node versi 21 - Alpine edition)
# untuk assignment Dicoding 3 - Membangun Arsitektur Microservices [Service Mesh dan Asynchronous Communication]
# Nama siswa: Lonard Steven - Jakarta

# Mengambil image Node.js versi 21 pada Docker - Alpine edition
FROM node:21-alpine as image
# Memposisikan working directory pada directory /shipping-srv-app
WORKDIR /shipping-srv-app
# Menyalin file .env ke directory /shipping-srv-app
COPY .env ./             
# Menyalin file package.json & package-lock.json (dan file lain dengan nama depan package dan ekstensi json) ke directory /shipping-srv-app
COPY package*.json ./
# Menambahkan command --no-cache setiap running Dockerfile
RUN apk add --no-cache bash
# Mengambil file wait-for-it.sh untuk memastikan bahwa service dijalankan setelah RabbitMQ service setelah diinisialisasi
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
# Mengubah permission file wait-for-it.sh yang telah diambil/didownload untuk dapat dieksekusi (+x)
RUN chmod +x /bin/wait-for-it.sh
# Menjalankan npm ci untuk menginstal dependencies yang dibutukan untuk NPM
RUN npm ci
# Menginstall NPM
RUN npm install
# Menyalin semua file dengan ekstensi js ke directory /shipping-srv-app
COPY ./*.js ./
# Membuka/ekspos port 3001 (untuk shipping service)
EXPOSE 3001
# Menjalankan command (CMD) "node index.js"
CMD ["node", "index.js"]