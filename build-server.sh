#!/bin/sh
sudo apt update && sudo apt upgrade -y && sudo apt install vim nano wget mariadb-server default-jre openjdk-17-jre -y
sudo service mariadb start

echo "Database Server Setting up..."
sudo mysql -u root

# mariadb/mysql のパスワードを書き換えてください。
# https://webkaru.net/mysql/mysql-root-password/
update mysql.user set password=password('ubuntu') where user = 'root';
flush privileges;
exit;

echo "Setting Done!"

sleep 1

echo "Creating minecraft..."
sleep 5
mkdir minecraft
echo "Created minecraft"
cd minecraft

echo "Downloading server..."
wget https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/167/downloads/paper-1.18.1-167.jar
echo "Download Done"

sleep 1

echo "Creating plugins..."
sleep 5
mkdir plugins
echo "Created plugins"
sleep 1
cd plugins
echo "Downloading plugins 6/1..."
wget https://github.com/Lenni0451/SpigotPluginManager/releases/download/2.7.1/PluginManager.jar
echo "Downloading plugins 6/2..."
wget https://www.iani.de/jenkins/job/LogBlock/lastSuccessfulBuild/artifact/target/LogBlock.jar
echo "Downloading plugins 6/3..."
wget https://github.com/TomXV/PaperMC-Server-Plugins/raw/main/worldedit-bukkit-7.2.8.jar
echo "Downloading plugins 6/4..."
wget https://github.com/TomXV/PaperMC-Server-Plugins/raw/main/worldguard-bukkit-7.0.6-dist.jar
echo "Downloading plugins 6/5..."
wget https://github.com/TomXV/PaperMC-Server-Plugins/blob/main/craftbook-3.10.5.jar
echo "Downloading plugins 6/6..."
wget https://www.spigotmc.org/resources/tabtps-1-8-8-1-18-show-tps-mspt-and-more-in-the-tab-menu.82528/download?version=429490
echo "Download plugins Done!"

sleep 1

cd ..
echo "Create a new start.sh"
cat << EOF > start.sh
java jar paper-1.18.1-167.jar -nogui
EOF

sudo chmod 777 start.sh

echo "*****************"
echo "Program finished!"
echo "*****************"