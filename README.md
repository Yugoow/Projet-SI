# Projet-SI
Projet SI
Pour permettre un déploiement optimisé et rapide de la DMZ et de ses différents services, on va utiliser un script qui va s’occuper d’aller télécharger toutes les applications et packages nécessaires à leurs déploiements.
Prérequis :
-	installer sudo <br>
``root@debian: ~# apt-get sudo``
-	installer curl <br>
``root@debian: ~# sudo apt-get curl``

Récupération du script :
Si la récupération du script en « physique » n’est pas possible, il faut dans ce cas le télécharger depuis github.
Pour cela il faut :
-	installer unzip <br>
``root@debian: ~# sudo apt-get unzip``
-	installer wget <br>
``root@debian: ~# sudo apt-get wget``
-	Récupérer le script depuis https://github.com/Yugoow/Projet-SI/releases/download/1.0-SI/scriptDMZ.zip <br>
``root@debian: ~# wget https://github.com/Yugoow/Projet-SI/releases/download/1.0-SI/scriptDMZ.zip``
-	dézipper le fichier récupéré <br>
``root@debian: ~# unzip scriptDMZ.zip``
-	donner les droits d'exécutions au script <br>
``root@debian: ~# chmod 777 script/script.sh``
-	exécuter le script <br>
``root@debian: ~# sudo ./script/script.sh``

<h1>Installation de Docker</h1>
En premier lieu le script va s’occuper d’installer docker et docker-compose. Deux composants permettant la création, définition et gestion de containeurs. Docker compose permet de déployer plusieurs services d’un seul coup.

![image](https://user-images.githubusercontent.com/56593824/140827482-8fa02132-44c1-4c19-a0d0-1be4901a7a81.png)

Ici on va venir vérifier si les deux composants sont bien installés et si on alors on les installe.


<h1>Installation du Serveur Web</h1>
Un fois l’installation de docker et docker compose réalisée, on va donc installer les images des services LAMP (Apache, MySQL, PHP). Pour cela on va réaliser un fichier docker-compose.yaml qui sera utilisé en input de la commande docker-compose. Ce fichier contient les informations sur les images, les ports, les paramètres, les volumes, ... des différents services.

![image](https://user-images.githubusercontent.com/56593824/140827234-d9457c7e-c62d-4ed5-8aad-1fb13c27b263.png)
<br>Fichier docker-compose.yaml

Pour l’installation de php, on a mis en place un fichier dockerfile, ce fichier va permettre d’émettre une série d’instructions pour l’installation d’une image. Ici php sera téléchargé avec l’extension mysql et PDO pour permettre la connexion à une base de données.

![image](https://user-images.githubusercontent.com/56593824/140827204-a1f44388-2766-466e-a7d1-801426101072.png)
<br>Fichier php.Dockerfile

![image](https://user-images.githubusercontent.com/56593824/140827182-67e5a94b-1a33-42b5-88bd-16dcf6beba5c.png)

Et finalement, on va venir « build » ces containers, en exécutant docker-compose up -d (-d est pour l’exécution en arrière-plan des services).


Schéma temporaire
![image](https://user-images.githubusercontent.com/56593824/140745965-02a549cd-989f-430d-b858-ec1f377a283b.png)


Sources:
https://linuxhint.com/lamp_server_docker/ 
