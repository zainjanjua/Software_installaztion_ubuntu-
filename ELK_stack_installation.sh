#!bi/bash
sudo apt-get update
sudo apt-get install openjdk-11-jdk wget apt-transport-https curl gnupg2 -y
java -version
apt upgarde -y
#install Nginx........................................................
sudo apt install nginx 
sudo systemctl start nginx
sudo systemctl status nginx
# Insatll and configure ElasticSearch.................................
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
sudo apt-get install apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt-get update && sudo apt-get install elasticsearch
sudo nano /etc/elasticsearch/elasticsearch.yml

sudo nano /etc/elasticsearch/jvm.options
#-Xms129m
#-Xms129m
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch
sudo systemctl status elasticsearch
#Insatall and Configure Kibana........................................
sudo apt-get install kibana
=============================================================================================================================
# Installing Elasticsearch on a docekr Container....................... 
sudo docker pull docker.elastic.co/elasticsearch/elasticsearch:8.4.3
sudo docker network create elastic
sudo sysctl -w vm.max_map_count=262144
sudo docker run --name es01 --net elastic -p 9200:9200 -p 9300:9300 -it docker.elastic.co/elasticsearch/elasticsearch:8.4.3
sudo docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
sudo docker cp es01:/usr/share/elasticsearch/config/certs/http_ca.crt .
sudo curl --cacert http_ca.crt -u elastic https://localhost:9200
#OR Install ELK Stack...........
sudo docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk
