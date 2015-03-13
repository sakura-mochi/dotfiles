#
# install.sh
# shell script
# Version 2.1
#
# Created by Teppei Kobayashi
# Last Modified 2015/03/12
#


# This script require network connection. If your system doesn't connection
# established, try this.
# > ip a
# > sudo chmod 0600 /etc/network/interfaces
# > sudo nano /etc/network/interfaces
# ---
# auto wlan0
# iface wlan0 inet dhcp
#         wpa-ssid SSID
#         wpa-psk PASSWORD
# ---
# > sudo ip link set wlan0 up
# > sudo ifup wlan0

# After cinnamon desktop installation, you need to commented out this configuration.
#
# If you want NetworkManager to manage your device, try this.
# > sudo nano /etc/NetworkManager/NetworkManager.conf
# ---
# [ifupdown]
# managed=true
# ---
# When you are done, reboot and see if issue is resolved.

# If you are using Let's note and want to use Wheelpad scroll, try this.
# > sudo nano /usr/share/X11/xorg.conf.d/50-synaptics.conf
# ---
# Section "InputClass"
#       Identifier "touchpad catchall"
#       Driver "synaptics"
#       MatchIsTouchpad "on"
#       MatchDevicePath "/dev/input/event*"
#       Option "CircularScrolling" "1"
#       Option "CircularScrollTrigger" "0"
#EndSection
# ---
# When you are done, reboot and see if issue is resolved.

# If you want to disable guest user in lightdm, try this.
# > sudo nano /etc/lightdm/lightdm.conf
# ---
# [SeatDefaults]
# allow-guest=false
# ---
# > sudo restart lightdm



# Configuration
GIT_USER="Teppei Kobayashi (Chamomile)"
GIT_MAIL="teppei.k.el@gmail.com"

# Setup
USER_NAME=`whoami`
echo "This script is created for Ubuntu Linux 14.04 (Trusty Tahr) minimal package."
echo "You are" ${USER_NAME}". If you are not" ${USER_NAME}", exit this script with C-c."
sudo echo "Required super user permission. Enter your sudo password."

cd /tmp


#
# Install compornents
#

## System compornents (from official repository)
sudo apt-get -y update
sudo apt-get -yV install xserver-xorg-core xinit alsa-base gdebi-core synaptic logrotate
sudo apt-get -yV install lightdm lightdm-gtk-greeter --no-install-recommends
sudo apt-get -yV install zsh gcc lv git nkf markdown screen
sudo apt-get -yV install fcitx-mozc chromium-browser cmigemo
sudo apt-get -yV install fonts-takao-pgothic fonts-takao-gothic fonts-taka-mincho
sudo apt-get -yV install doxygen doxygen-gui graphviz qpdfview
sudo apt-get -yV install gimp dia gnome-screenshot
sudo apt-get -yV install emacs24 emacs24-el emacs-mozc emacs-mozc-bin

## Package compornents
sudo apt-get -yV install software-properties-common

## Add unofficial repository
sudo add-apt-repository -y ppa:tsvetko.tsvetkov/cinnamon
sudo add-apt-repository -y ppa:texlive-backports/ppa
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update

## System compornents (from unofficial repository)
sudo apt-get -yV install cinnamon
sudo apt-get -yV install texlive-lang-cjk


#
# User compornents
#
sudo apt-get -yV install oracle-java8-installer
sudo apt-get -yV install oracle-java8-set-default

## percol
git clone http://github.com/mooz/percol.git
cd percol
sudo python setup.py install

## Java
sudo update-java-alternatives --jre -s java-8-oracle
sudo update-java-alternatives --jre-headless -s java-8-oracle
sudo update-java-alternatives -s java-8-oracle
sudo update-alternatives --config java
update-java-alternatives -l

## Flash plugin
sudo apt-get -yV install pepperflashplugin-nonfree
sudo update-pepperflashplugion-nonfree --install


#
# User configurations
#

# git configuration
git config --global user.name ${GIT_USER}
git config --global user.email ${GIT_MAIL}
git config --global core.editor "emacs"
git config --global color.ui auto

# Shell configuration
ZSH_DIRECTORY=`which zsh`
sudo chsh -s ${ZSH_DIRECTORY} ${USER_NAME}

# Create dotfiles symbolic links
cd ~
mkdir dotfiles
cd dotfiles
git init
git remote add dotfiles http://github.com/toronty/dotfiles.git
cd ~
ln -s dotfiles/.emacs.d/ .emacs.d
ln -s dotfiles/.zshrc .zshrc
ln -s dotfiles/.screenrc .screenrc
ln -s dotfiles/.dir_colors .dir_colors
ln -s dotfiles/.percol.d/ .percol.d
ln -s dotfiles/.Xresources .Xresorces
xrdb ~/.Xresorces


#
# OpenCV
#

sudo apt-get -yV install build-essential
sudo apt-get -yV install libboost1.46-all-dev

cd /tmp
sudo apt-get source opencv
sudo apt-get -yV build-dep opencv
sudo apt-get -yV install libqt4-dev
sudo apt-get -yV install libgtk2.0-dev
sudo apt-get -yV install pkg-config
sudo apt-get -yV install opencl-headers
sudo apt-get -yV install libgomp1
sudo apt-get -yV install libjpeg-dev
sudo apt-get -yV install libopenjpeg-dev
sudo apt-get -yV install jasper
sudo apt-get -yV install libjasper-dev libjasper-runtime
sudo apt-get -yV install libpng12-dev
sudo apt-get -yV install libpng++-dev libpng3
sudo apt-get -yV install libpnglite-dev libpngwriter0-dev libpngwriter0c2
sudo apt-get -yV install libtiff-dev libtiff-tools pngtools
sudo apt-get -yV install zlib1g-dev zlib1g-dbg
sudo apt-get -yV install v4l2ucp
sudo apt-get -yV install python2.7
sudo apt-get -yV install python2.7-dev
sudo apt-get -yV install autoconf
sudo apt-get -yV install libtbb2 libtbb-dev
sudo apt-get -yV install libeigen2-dev
sudo apt-get -yV install cmake
sudo apt-get -yV install openexr
sudo apt-get -yV install gstreamer-plugins-*
sudo apt-get -yV install freeglut3-dev
sudo apt-get -yV install libglui-dev
sudo apt-get -yV install libavc1394-dev libdc1394-22-dev libdc1394-utils
sudo apt-get -yV install libxine-dev
sudo apt-get -yV install libxvidcore-dev
sudo apt-get -yV install libva-dev
sudo apt-get -yV install libssl-dev
sudo apt-get -yV install libv4l-dev
sudo apt-get -yV install libvo-aacenc-dev
sudo apt-get -yV install libvo-amrwbenc-dev
sudo apt-get -yV install libvorbis-dev
sudo apt-get -yV install libvpx-dev
sudo apt-get -yV install libopenni2-dev

cd /tmp
if [ ! -f OpenCV-2.4.10.zip ]; then
    wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.10/opencv-2.4.10.zip
fi

sudo rm -rf opencv-2.4.10
unzip /tmp/opencv-2.4.10.zip
cd opencv-2.4.10
cmake -DBUILD_DOCS=ON -DBUILD_EXAMPLES=ON -DCMAKE_BUILD_TYPE=RELEASE -DWITH_TBB=ON -DWITH_GTK=ON -DWITH_OPENGL=ON -DWITH_QT=ON -DINSTALL_C_EXAMPLES=ON -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DWITH_OPENNI=ON -DWITH_UNICAP=ON -DWITH_V4L=ON -DWITH_XINE=ON  .
make
sudo make install
sudo ldconfig


# exit
cd ~
sudo apt-get autoremove
sudo apt-get autoclean
