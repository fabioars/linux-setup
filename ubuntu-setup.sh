#!/usr/bin/env bash

start() {
    sudo apt update

    # Install Ubuntu Restricted Extras
    sudo apt-get install ubuntu-restricted-extras -y

    # Install Curl
    sudo apt-get install curl -y

    # Install Vim
    sudo apt-get install vim -y
}

# Install Git
install_git() {
    sudo apt install git -y
    git config --global user.name "Fabio Soares"
    git config --global user.email fabioars@live.com 
}

# Install Terminal
install_terminal() {
    sudo apt install tilix -y
    sudo apt install zsh -y
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
}

# Install Python
install_python() {
    sudo apt-get install python3 python3-pip -y

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
    wget https://az764295.vo.msecnd.net/stable/1b8e8302e405050205e69b59abb3559592bb9e60/code_1.31.1-1549938243_amd64.deb
    sudo dpkg -i code_1.31.1-1549938243_amd64.deb
    rm -rf code_1.31.1-1549938243_amd64.deb
    sudo apt-get install -f -y
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
    sudo apt-get install qemu-kvm
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
}

install_all
