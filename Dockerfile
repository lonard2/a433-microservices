# Dockerfile untuk proyek pertama submission Dicoding - Membangun Arsitektur Microservices
# oleh Lonard Steven - Jakarta

# Mengambil base image dari Node.js, versi 14 (utama) dengan FROM
FROM node:14

# Melakukan setting working directory ke /app, dengan WORKDIR
WORKDIR /app

# Menyalin semua bagian source code proyek ke dalam working directory dengan COPY
COPY . .

# Memastikan aplikasi dioperasikan dalam production mode environment, serta mengatur database host ke item-db
ENV NODE_ENV=production DB_HOST=item-db

# Melakukan instalasi dependencies yang diperlukan untuk production, dialnjutkan dengan build (melalui npm)
RUN npm install --production --unsafe-perm && npm run build

# Melakukan expose port terkait aplikasi ke port bernomor 8080.
EXPOSE 8080

# Menjalankan/run server dengan command npm start. Setiap kata yang dituliskan pada CMD harus dipisah.
CMD ["npm", "start"]

# Melakukan labeling image agar langsung terhubung/connected dengan repository GitHub terkait proyek (yang telah diclone)
# Labeling source/repository yang akan dihubungkan dengan image (diisi dengan link repository dari proyek bersangkutan)
LABEL org.opencontainers.image.source https://github.com/lonard2/a433-microservices

# Labeling deskripsi dari image.
LABEL org.opencontainers.image.description "Belajar Membangun Microservices image file for Dicoding assignments - Lonard Steven"
