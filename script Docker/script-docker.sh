#!/bin/sh
echo "Installation des composants de Centreon ..."

docker_init() {
	echo "Installation de Docker ..."

	if [ ! -e docker-sh/get-docker.sh ]; then
		mkdir docker-sh
		curl -fsSL https://get.docker.com -o docker-sh/get-docker.sh
		sh ./docker-sh/get-docker.sh
	fi

	#Ajout du groupe docker à un utilisateur
	#usermod -aG docker $USER

	docker --version
	echo  "Installation de Docker : TERMINEE"
}

dockerC_init() {
	echo "Installation de Docker Compose ..."
	curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose

	#Dans le cas ou on ne peut pas exécuter, créer un lien
	#ln -s /usr/local/bin/docker-composer /usr/bin/docker-compose

	docker-compose --version
	echo "Installation de Docker Compose : TERMINEE"
}


echo "FIN"

