# FROM ubuntu:latest
FROM ubuntu:22.04

# donwload image and run on it
RUN apt update && apt upgrade

# -y pour répondre auto en oui; on tree pour voir les fichiers; unzip pour l'extraction
RUN apt install -y mysql-server tree zip \
    unzip htop
# Exposer le port
EXPOSE 3306 
# Commande pour lancer le service mysql
# On crée un tableau de mots clés de commande que le CMD pourra utiliser
CMD ["mysqld"]
