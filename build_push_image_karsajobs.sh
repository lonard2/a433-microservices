#! /bin/bash

# Shell scripting untuk build (membangun) dan push image aplikasi Karsajobs backend
# untuk assignment Dicoding 2 - Membangun Arsitektur Microservices
# Nama siswa: Lonard Steven - Jakarta
			
# Membangun image docker (local) dari Dockerfile yang telah tersedia dengan nama karsajobs (mengingat script untuk bagian backend aplikasi)
# dan dibuatkan untuk versi latest. Image akan menggunakan username lonard2.
docker build -t lonard2/karsajobs:latest

# Membuat sebuah environment variable bernama PAT_BE (personal access token) yang berisikan token PAT dari GitHub yang telah diperbolehkan
# (allowed) akses write & read package serta repository / repo. Perannya ialah untuk mendukung proses login Docker.
export PAT_BE=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

# Login Docker ke container registry ghcr.io (GitHub Packages) dengan username GitHub pribadi dan password account berupa PAT_BE (environment variable)
# pada line sebelumnya.
echo $PAT_BE | docker login ghcr.io -u lonard2 --password-stdin

# Dengan tag, nama image Docker dari nama local yakni lonard2/karsajobs:latest menjadi nama yang mengikuti standar GitHub Packages
# (ghcr.io/NAMESPACE/package_name:tag) yakni ghcr.io/lonard2/karsajobs:latest
docker tag lonard2/karsajobs:latest ghcr.io/lonard2/karsajobs:latest

# Melakukan push atau upload image ke GitHub Packages melalui GitHub Container Registry (ghcr.io) dengan nama karsajobs
# untuk versi latest. Username yang digunakan ialah username pribadi (lonard2).
docker push ghcr.io/lonard2/karsajobs:latest
