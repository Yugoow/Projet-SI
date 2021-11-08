#!/bin/bash
# Script sauvegarde rsync https://www.funix.org inspiré par
# celui de  Mickaël BONNARD ( https://www.mickaelbonnard.fr )
# sous licence MIT ( http://choosealicense.com/licenses/mit/ )

# Variables
# date et heure
jour=`date +%d-%B-%Y`
# répertoire contenant les logs
log="/var/log/sauvegarde"

# répertoires à sauvegarder
local1="/data"
local2="/home"

# point de montage du disque de sauvegarde
distant="/media/sauvegardes"

# fichiers et répertoires à exclure de la sauvegarder
excludes1="/root/bin/exclude-data.txt"
excludes2="/root/bin/exclude-home.txt"

# test de vérification de la présence du disque de sauvegarde
if [ ! -e "$distant" ]
then
    echo "Le disque de sauvegarde n'est pas monté, arrêt du script"
    exit
fi

echo "-------------------------------------------------------------" > $log/sauvegarde_$jour.log

# nom de la sauvegarde dans le journal
echo "Sauvegarde de $local1 et $local2 du $(date +%d-%B-%Y)" >> $log/sauvegarde_$jour.log

echo "-------------------------------------------------------------" >> $log/sauvegarde_$jour.log

# heure de début du transfert dans le journal
echo "Heure de demarrage de la sauvegarde : $(date +%H:%M:%S)" >> $log/sauvegarde_$jour.log

echo "-------------------------------------------------------------" >> $log/sauvegarde_$jour.log

# transfert des fichiers

rsync -az --stats --delete-after --exclude-from=$excludes1 $local1 $distant >> $log/sauvegarde_$jour.log
rsync -az --stats --delete-after --exclude-from=$excludes2 $local2 $distant >> $log/sauvegarde_$jour.log

# -a : mode archivage ( équivalent -rlptgoD ).
# -z : compression des données pendant le transfert.
# -- stats donne des informations sur le transfert (nombre de fichiers…).
# --delete-after : supprime les fichiers qui n’existent plus dans la source après le transfert dans le dossier de destination.

status=$?

echo ""  >> $log/sauvegarde_$jour.log

#code d'erreurs rsync

case $status in
0) echo Succès >> $log/sauvegarde_$jour.log;;
1) echo Erreur de syntaxe ou d'utilisation >> $log/sauvegarde_$jour.log;;
2) echo Incompatibilité de protocole >> $log/sauvegarde_$jour.log;;
3) echo Erreurs lors de la sélection des fichiers et des répertoires d'entrée/sortie >> $log/sauvegarde_$jour.log;;
4) echo Action non supportée : une tentative de manipulation de fichiers 64-bits sur une plate-forme qui ne les supporte pas \
 ; ou une option qui est supportée par le client mais pas par le serveur. >> $log/sauvegarde_$jour.log;;
5) echo Erreur lors du démarrage du protocole client-serveur >> $log/sauvegarde_$jour.log;;
6) echo Démon incapable d'écrire dans le fichier de log >> $log/sauvegarde_$jour.log;;
10) echo Erreur dans la socket E/S >> $log/sauvegarde_$jour.log;;
11) echo Erreur d'E/S fichier >> $log/sauvegarde_$jour.log;;
12) echo Erreur dans le flux de donnée du protocole rsync >> $log/sauvegarde_$jour.log;;
13) echo Erreur avec les diagnostics du programme >> $log/sauvegarde_$jour.log;;
14) echo Erreur dans le code IPC>> $log/sauvegarde_$jour.log;;
20) echo SIGUSR1 ou SIGINT reçu >> $log/sauvegarde_$jour.log;;
21) echo "Une erreur retournée par waitpid()" >> $log/sauvegarde_$jour.log;;
22) echo  Erreur lors de l'allocation des tampons de mémoire principaux >> $log/sauvegarde_$jour.log;;
23) echo Transfert partiel du à une erreur >> $log/sauvegarde_$jour.log;;
24) echo Transfert partiel du à la disparition d'un fichier source >> $log/sauvegarde_$jour.log;;
25) echo La limite --max-delete a été atteinte >> $log/sauvegarde_$jour.log;;
30) echo Dépassement du temps d'attente maximal lors d'envoi/réception de données >> $log/sauvegarde_$jour.log;;
35) echo Temps d’attente dépassé en attendant une connection >> $log/sauvegarde_$jour.log;;
255) echo Erreur inexpliquée >> $log/sauvegarde_$jour.log;;
esac

echo "-------------------------------------------------------------" >> $log/sauvegarde_$jour.log

# heure de fin dans le journal

echo "Jour de fin de sauvegarde : $(date +%d-%B-%Y)" >> $log/sauvegarde_$jour.log
echo "Heure de fin de la sauvegarde : $(date +%H:%M:%S)" >> $log/sauvegarde_$jour.log

echo "-------------------------------------------------------------" >> $log/sauvegarde_$jour.log

exit