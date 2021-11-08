# Projet-SI
Projet SI
Pour permettre un déploiement optimisé et rapide de la DMZ et de ses différents services, on va utiliser un script qui va s’occuper d’aller télécharger toutes les applications et packages nécessaires à leurs déploiements.
Prérequis :
-	installer sudo
``root@debian: ~# apt-get sudo``
-	installer curl
``root@debian: ~# sudo apt-get curl``

Récupération du script :
Si la récupération du script en « physique » n’est pas possible, il faut dans ce cas le télécharger depuis github.
Pour cela il faut :
-	installer unzip
``root@debian: ~# sudo apt-get unzip``
-	installer wget
``root@debian: ~# sudo apt-get wget``
-	Récupérer le script depuis https://github.com/Yugoow/Projet-SI/releases/download/1.0-SI/scriptDMZ.zip
``root@debian: ~# wget https://github.com/Yugoow/Projet-SI/releases/download/1.0-SI/scriptDMZ.zip``
-	dézipper le fichier récupéré
``root@debian: ~# unzip scriptDMZ.zip``
-	donner les droits d'exécutions au script
``root@debian: ~# chmod 777 script/script.sh``
-	exécuter le script
``root@debian: ~# sudo ./script/script.sh``

Prérequis avant exécution des script :
- installer sudo ( apt-get sudo )
- installer curl ( sudo apt-get curl )
- installer unzip ( sudo apt-get unzip )
- récupérer un script ( wget https://github.com/Yugoow/Projet-SI/releases/download/1.0-SI/scriptDocker.zip )
- dézipper le fichier récupéré
- donner les droits d'exécutions au script ( chmod 777 scriptDocker.sh )
- exécuter le script ( sudo ./script.Docker.sh )



Schéma temporaire
![image](https://user-images.githubusercontent.com/56593824/140745965-02a549cd-989f-430d-b858-ec1f377a283b.png)


Sources:
https://linuxhint.com/lamp_server_docker/ 
