#! /bin/bash

# Docker Item App Image Building, Pushing, and Running Shell/Bash Script
# untuk assignment Dicoding 1 - Membangun Arsitektur Microservices
# Nama siswa: Lonard Steven - Jakarta

docker build -t item-app:v1 . 					# 1. Membangun/membuat image Docker dari Dockerfile folder terkait
								# (a433-microservices) dengan nama item-app dengan tag versi v1.

docker images							# 2. Menampilkan daftar image pada lokal komputer saat ini

docker tag item-app:v1 ghcr.io/lonard2/item-app:v1		# 3. Mengubah nama image Docker dari item-app (dengan tag
								# versi v1) menjadi ghcr.io/lonard2/item-app (dengan tag
								# versi v1) agar sesuai dengan standar GitHub Packages
								# (ghcr.io/NAMESPACE/package_name:tag)


export PAT=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		# 4a. Membuat sebuah environment variable dengan nama PAT yang berisikan
								# personal access token GitHub yang telah di-allow akses write, read,
								# dan delete package. Hal ini akan berguna dalam proses login Docker
								# pada langkah 4b.

echo $PAT | docker login ghcr.io -u lonard2 --password-stdin	# 4b. Melakukan login Docker ke container registry milik GitHub Packages
								# ghcr.io dengan username account GitHub pribadi dan password account
								# yang diperoleh dari environment variable PAT (diisi via stdin terhadap
								# terkait)

docker push ghcr.io/lonard2/item-app:v1				# 5. Melakukan push/upload image Docker dengan nama item-app dan
								# tag versi v1 ke dalam GitHub Packages, melalui container registrynya.




