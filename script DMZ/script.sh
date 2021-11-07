#!/bin/sh
echo "Installation des composants au sein de la DMZ d'Abstergo ..."

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


docker_p="/home/docker/"
lamp_p="$docker_p/lamp"
html_p="$lamp_p/html"

www_p="www/"
composants_p="composants/"


echo "Verification de l'installation de Docker"
docker --version

if [ $? != 0 ]; then
	docker_init
fi

echo "Verification de l'installation de Docker Compose"
docker-compose --version

if [ $? != 0 ]; then
	dockerC_init
fi


echo "Installation des composants Web ..."

mkdir -p $html_p
cp $www_p/* $html_p/
cp $composants_p/docker-compose.yaml $lamp_p/docker-compose.yaml
cp $composants_p/php.Dockerfile $lamp_p/php.Dockerfile

echo "Installation des composants Web : TERMINEE"

echo "==========================================================================="
echo "Pour mettre en route les services tappez : docker-compose up -d"
echo "Pour obtenir des informations sur les services lancés tappez : docker-compose ps"
echo "Pour mettre fin aux services tappez : docker-compose down"

echo "==========================================================================="
echo "Lancement des services..."
cd $lamp_p
docker-compose up -d

echo "FIN"

