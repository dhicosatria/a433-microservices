#!/bin/bash

# Nama image dan tag
IMAGE_NAME="item-app"
TAG="v1"
DOCKERHUB_USERNAME="dhicosatria" # Ganti dengan username Docker Hub Anda
DOCKERHUB_REPO="$DOCKERHUB_USERNAME/$IMAGE_NAME"

# 1. Membuat Docker image dengan nama 'item-app' dan tag 'v1'
docker build -t $IMAGE_NAME:$TAG .

# 2. Melihat daftar image di lokal
docker images

# 3. Mengubah nama image agar sesuai dengan format Docker Hub
docker tag $IMAGE_NAME:$TAG $DOCKERHUB_REPO:$TAG

# 4. Login ke Docker Hub
echo "Login ke Docker Hub..."
docker login --username $DOCKERHUB_USERNAME

# 5. Mengunggah image ke Docker Hub
docker push $DOCKERHUB_REPO:$TAG

# Konfirmasi
echo "Docker image '$DOCKERHUB_REPO:$TAG' berhasil diunggah ke Docker Hub."

