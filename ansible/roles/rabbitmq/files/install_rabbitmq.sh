cat >> /etc/apt/sources.list <<EOT
deb http://www.rabbitmq.com/debian/ testing main
EOT

wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo apt-key add rabbitmq-signing-key-public.asc


sudo apt-get update

sudo apt-get install -q -y rabbitmq-server


# RabbitMQ Plugins
service rabbitmq-server stop

rabbitmq-plugins enable rabbitmq_management

service rabbitmq-server start

# check plugins
#rabbitmq-plugins list





