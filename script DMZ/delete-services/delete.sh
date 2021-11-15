#!/bin/sh

echo "Suppression des images"
docker rmi "$(docker images -a -q)"

echo "Suppresion des containers"
docker stop "$(docker ps -a -q)"
docker rm "$(docker ps -a -q)"

docker volume rm lamp_mysql-data
echo "Attention les volumes n'ont pas été supprimés"

#Suppression de docker
#sudo rm /usr/local/bin/docker-compose

#sudo apt-get purge docker-ce docker-ce-cli containerd.io
#sudo rm -rf /var/lib/docker
#sudo rm -rf /var/lib/containerd

