#!/bin/bash

# Variabel untuk memudahkan konfigurasi
DOCKER_USERNAME="rudyekoprasetya"
IMAGE_NAME="shipping-service"
TAG="latest"

# Membuat Docker image dari Dockerfile
# Mengasumsikan script dijalankan di folder yang sama dengan Dockerfile
echo "--- Building Docker Image ---"
docker build -t $IMAGE_NAME:$TAG .

# Mengubah nama image (Tagging) agar sesuai format Docker Hub
# Format: username/repository:tag
echo "--- Tagging Image for Docker Hub ---"
docker tag $IMAGE_NAME:$TAG $DOCKER_USERNAME/$IMAGE_NAME:$TAG

# Login ke Docker Hub via Terminal
# Catatan: Untuk keamanan di server production, gunakan --password-stdin
echo "--- Logging into Docker Hub ---"
echo $PASSWORD_DOCKER_HUB | docker login -u $DOCKER_USERNAME --password-stdin

# Mengunggah image ke Docker Hub
echo "--- Pushing Image to Docker Hub ---"
docker push $DOCKER_USERNAME/$IMAGE_NAME:$TAG

echo "--- Process Completed Successfully! ---"