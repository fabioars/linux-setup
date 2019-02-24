sudo apt update

# Install Terminal
sudo apt install tilix -y

# Install Git
sudo apt install git -y
git config --global user.name "Fabio Soares"
git config --global user.email fabioars@live.com 

# Install Spotify
sudo snap install spotify

# Install PyCharm
sudo snap install pycharm-community --classic

# Install Gnome Tweak
wget https://launchpad.net/ubuntu/+archive/primary/+files/gnome-tweak-tool_3.26.2.1-1ubuntu1_all.deb -O gnome-tweak-tool.deb
sudo dpkg -i gnome-tweak-tool.deb
rm -rf gnome-tweak-tool.deb
sudo apt-get install -f

# Install Python
sudo apt-get install python3 python3-pip -y

# Install Curl
sudo apt-get install curl -y

# Install Node - NVM
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 10
nvm use 10
npm i -g create-react-app
npm i -g create-react-native-app

# Install Vim
sudo apt-get install vim -y

# Install Numix
sudo apt install numix-icon-theme -y
sudo apt install numix-gtk-theme -y

# Install Ubuntu Restricted Extras
sudo apt-get install ubuntu-restricted-extras -y

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
sudo apt-get install -f

# Install VSCode
wget https://az764295.vo.msecnd.net/stable/1b8e8302e405050205e69b59abb3559592bb9e60/code_1.31.1-1549938243_amd64.deb
sudo dpkg -i code_1.31.1-1549938243_amd64.deb
rm -rf code_1.31.1-1549938243_amd64.deb
sudo apt-get install -f

# Install Java
sudo apt-get install openjdk-8-jdk -y

# Install Android
mkdir Softwares
cd Softwares
wget https://dl.google.com/dl/android/studio/ide-zips/3.3.1.0/android-studio-ide-182.5264788-linux.zip
unzip android-studio-ide-182.5264788-linux.zip
rm -rf android-studio-ide-182.5264788-linux.zip
sudo apt-get install qemu-kvm
cd ..

# Install Telegram
cd Softwares
wget https://updates.tdesktop.com/tlinux/tsetup.1.5.15.tar.xz
tar xf tsetup.1.5.15.tar.xz
rm -rf tsetup.1.5.15.tar.xz
cd ..

