# install docker and docker-compose
##########################################################
#
# このファイルを読んでください
#
#########################################################
# 0. Introduction, Prerequisites
# 
#  注意! 基本的なLinuxの操作ができること
#
#  $ cat /etc/os-release | grep VERSION
#  VERSION="20.04.2 LTS (Focal Fossa)"
#  VERSION_ID="20.04"
#  VERSION_CODENAME=focal
#
#  Ubuntu20.04にdocker, docker-composeをインストールします。
#
# 2. install docker and docker-compose 
#  $ setup_docker_ubuntu20.04.sh
#
# 3. add user into docker group
#  $ sudo usermod -aG docker <your-user>
#
# 4. reboot os
#  $ sudo reboot
#
# 5. verify version
#  $ docker version
#  $ docker-compose --version

# docker (see https://docs.docker.com/engine/install/ubuntu/)
sudo apt-get update
sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
sudo apt-get update
#sudo apt-get install -y docker-ce docker-ce-cli containerd.io
# veresionを固定してインストール
# versionの確認は
#  $ apt-cache madison docker-ce
sudo apt-get install -y docker-ce=5:20.10.2~3-0~ubuntu-focal docker-ce-cli=5:20.10.2~3-0~ubuntu-focal containerd.io

#docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

