#!/bin/sh

sudo apt update && sudo apt upgrade -y && sudo apt install vim nano wget mariadb-server default-jre openjdk-17-jre -y
echo "Database Server Setting up..."

    # mariadb/mysql のパスワードを書き換えてください。
    # https://webkaru.net/mysql/mysql-root-password/

    sudo service mysql start && mysqladmin -u root password 'ubuntu' ||\
    echo """
************************************************************************
パスワードがすでに設定されてます! DBのパスワードをリセットしてください
Shellは、動作し続けますが、DBのパスワードは正常に設定できませんでした

Tips:Shellは、Ctrl+C を押すと終了できます。
************************************************************************
"""

echo "Setting Done!"

sleep 5

echo "Creating dir minecraft..."
    sleep 5
    mkdir minecraft
    echo "Created dir minecraft"
    cd minecraft

    echo "Downloading server..."
    wget https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/167/downloads/paper-1.18.1-167.jar
echo "Download Done"

sleep 5

echo "Creating dir plugins..."
    sleep 5
    mkdir plugins
echo "Created dir plugins"
    sleep 5
    cd plugins
    echo "Downloading plugins 6/1..."
    wget https://github.com/Lenni0451/SpigotPluginManager/releases/download/2.7.1/PluginManager.jar

    sleep 5

    echo "Downloading plugins 6/2..."
    wget https://www.iani.de/jenkins/job/LogBlock/lastSuccessfulBuild/artifact/target/LogBlock.jar

    sleep 5

    echo "Downloading plugins 6/3..."
    wget https://github.com/TomXV/PaperMC-Server-Plugins/raw/main/worldedit-bukkit-7.2.8.jar

    sleep 5

    echo "Downloading plugins 6/4..."
    wget https://github.com/TomXV/PaperMC-Server-Plugins/raw/main/worldguard-bukkit-7.0.6-dist.jar

    sleep 5

    echo "Downloading plugins 6/5..."
    wget https://github.com/TomXV/PaperMC-Server-Plugins/blob/main/craftbook-3.10.5.jar

    sleep 5

    echo "Downloading plugins 6/6..."
    wget https://www.spigotmc.org/resources/tabtps-1-8-8-1-18-show-tps-mspt-and-more-in-the-tab-menu.82528/download?version=429490

    sleep 5

echo "Download plugins Done!"

sleep 5

cd ..
echo "Create a new start.sh"
    cat << EOF > start.sh
        java jar paper-1.18.1-167.jar -nogui
    EOF

sudo chmod 777 start.sh

sleep 5

echo "*****************"
echo "Program finished!"
echo "*****************"