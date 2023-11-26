#! /bin/bash

# Shell scripting untuk build (membangun) dan push image aplikasi Karsajobs frontend / UI
# untuk assignment Dicoding 2 - Membangun Arsitektur Microservices
# Nama siswa: Lonard Steven - Jakarta
			
# Membangun image docker (local) dari Dockerfile yang telah tersedia dengan nama karsajobs-ui (mengingat script untuk bagian frontend aplikasi)
# dan dibuatkan untuk versi latest. Image akan menggunakan username lonard2.
docker build -t lonard2/karsajobs-ui:latest .

# Login Docker ke container registry ghcr.io (GitHub Packages) dengan username GitHub pribadi dan password account berupa PAT_BE (environment variable)
# pada line sebelumnya.
echo ${PERSONAL_ACCESS_TOKEN} | docker login ghcr.io -u lonard2 --password-stdin

# Dengan tag, nama image Docker dari nama local yakni lonard2/karsajobs-ui:latest menjadi nama yang mengikuti standar GitHub Packages
# (ghcr.io/NAMESPACE/package_name:tag) yakni ghcr.io/lonard2/karsajobs-ui:latest
docker tag lonard2/karsajobs-ui:latest ghcr.io/lonard2/karsajobs-ui:latest

# Melakukan push atau upload image ke GitHub Packages melalui GitHub Container Registry (ghcr.io) dengan nama karsajobs-ui
# untuk versi latest. Username yang digunakan ialah username pribadi (lonard2).
docker push ghcr.io/lonard2/karsajobs-ui:latest
