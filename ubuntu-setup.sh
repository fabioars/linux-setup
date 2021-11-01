#!/usr/bin/env bash

start() {
    sudo apt update

    # Install Ubuntu Restricted Extras
    sudo apt-get install ubuntu-restricted-extras -y

    # Install
    sudo apt-get install curl vim make -y
}

# Install Git
install_git() {
    sudo apt install git -y
    git config --global user.name "Fabio Soares"
    git config --global user.email fabioars@live.com 
    git config --global init.defaultBranch main
}

# Install Terminal
install_terminal() {
    sudo apt install tilix -y
    sudo apt install zsh -y
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    
    # spf13 vim
    curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
    sh <(curl https://j.mp/spf13-vim3 -L)
}

# Install Python
install_python() {
    sudo apt-get install python3 python3-pip libmysqlclient-dev -y

    pip3 install --user virutalenv

    echo export PATH="$PATH:$HOME/.local/bin" >> $HOME/.zshrc

    # Install PyCharm
    sudo snap install pycharm-community --classic
}

# Install Spotify
install_spotify() {
    sudo snap install spotify
}

# Install Gnome Tweak
install_gnome_tweak() {
    wget https://launchpad.net/ubuntu/+archive/primary/+files/gnome-tweak-tool_3.26.2.1-1ubuntu1_all.deb -O gnome-tweak-tool.deb
    sudo dpkg -i gnome-tweak-tool.deb
    rm -rf gnome-tweak-tool.deb
    sudo apt-get install -f -y
}

# Install Node - NVM
install_node() {
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
    export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    nvm install 10
    nvm use 10
    npm i -g create-react-app
    npm i -g create-react-native-app
    npm i -g gitignore
    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install --no-install-recommends yarn -y
}

# Install Numix
install_numix() {
    sudo apt install numix-icon-theme -y
    sudo apt install numix-gtk-theme -y
}

# Install Chrome
install_chrome() {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm -rf google-chrome-stable_current_amd64.deb
    sudo apt-get install -f -y
}

# Install VSCode
install_vscode() {
    sudo snap install code --classic
}

create_softwares_folder() {
    software_path="${HOME}/Softwares"
    if [ ! -d "${software_path}" ]; then
        echo "mkdir -p $software_path"
        mkdir -p "${software_path}"
    else
        echo "Found softwares dir $software_path"
    fi
}

install_java() {
    # Install Java
    sudo apt-get install openjdk-8-jdk -y
}

# Install Android
install_android() {
    create_softwares_folder
    cd ~/Softwares
    wget https://dl.google.com/dl/android/studio/ide-zips/3.3.1.0/android-studio-ide-182.5264788-linux.zip
    unzip android-studio-ide-182.5264788-linux.zip
    rm -rf android-studio-ide-182.5264788-linux.zip
    sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils -y
    sudo adduser $(whoami) kvm
    cd ~
}

# Install Telegram
install_telegram() {
    create_softwares_folder
    wget https://updates.tdesktop.com/tlinux/tsetup.1.5.15.tar.xz
    tar xf tsetup.1.5.15.tar.xz
    rm -rf tsetup.1.5.15.tar.xz
    cd ~
}

# Install Font Fira Code
install_firacode() {
    fonts_dir="${HOME}/.local/share/fonts"
    if [ ! -d "${fonts_dir}" ]; then
        echo "mkdir -p $fonts_dir"
        mkdir -p "${fonts_dir}"
    else
        echo "Found fonts dir $fonts_dir"
    fi

    for type in Bold Light Medium Regular Retina; do
        file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
        file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
        if [ ! -e "${file_path}" ]; then
            echo "wget -O $file_path $file_url"
            wget -O "${file_path}" "${file_url}"
        else
        echo "Found existing file $file_path"
        fi;
    done

    echo "fc-cache -f"
    fc-cache -f
}

install_vlc() {
    sudo apt-get install vlc -y
}

install_steam() {
    wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
    sudo dpkg -i steam.deb
    sudo apt-get install -f -y
    rm -rf steam.deb
}

install_flutter() {
    create_softwares_folder
    cd ~/Softwares
    wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.2.1-stable.tar.xz
    tar xf flutter_linux_v1.2.1-stable.tar.xz
    echo export PATH="$PATH:`pwd`/flutter/bin" >> $HOME/.zshrc
    cd ~
}

install_mariadb() {
    sudo apt-get install software-properties-common -y
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64] http://mirror.zol.co.zw/mariadb/repo/10.3/ubuntu bionic main' -y
    sudo apt-get update
    sudo apt-get install mariadb-server mariadb-client -y
}

install_docker() {
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    # lsb_release -cs to see current version of ubuntu
    sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable' -y
    sudo apt-get update
    sudo apt-get install docker-ce -y
    sudo groupadd docker
    sudo usermod -aG docker $USER

    sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
}

install_all() {
    start
    install_git
    install_terminal
    install_python
    install_spotify
    install_gnome_tweak
    install_node
    install_numix
    install_chrome
    install_vscode
    install_java
    install_android
    install_telegram
    install_firacode
    install_vlc
    install_steam
    install_flutter
    install_mariadb
    install_docker
}

install_all
