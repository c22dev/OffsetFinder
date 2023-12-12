clear
echo "LibPatchFinderInstaller v0.2 - made by c22dev\nThis should help you install libpatchfinder. Please make sure brew and Xcode Command Line tools are installed.\nThis script needs sudo to work. Please enter your mac password."
sudo echo "Sudoed successfuly !"
echo "Installing autoconf, automake, libtool, pkg-config, openssl"
# Brew some packages (those available)
brew install autoconf
brew install automake
brew install libtool
brew install pkg-config
brew install openssl
read -p "Do you want to uninstall your current Python installation ? The script will install python back. (RECOMMENDED, y or n)" confirm
 if [[ "$confirm" == "y" ]]; then
    echo "Deleting python install..."
    sudo rm -rf /Library/Frameworks/Python.framework/
    sudo rm -rf /usr/local/bin/python3
    brew uninstall python --force && brew uninstall python3 --force
    echo "Installing python again..."
    brew install python
 fi
# pyimg4
echo "Installing python dependencies..."
pip3 install pyimg4

mkdir workingLPFI
cd workingLPFI
echo "Cloning libpatchfinder and dependencies..."
# clone all git repos
# libpatchfinder is mine cause a fix wasnt pushed for a new version of libgeneral
git clone --recursive https://github.com/c22dev/libpatchfinder
git clone --recursive https://github.com/tihmstar/img4tool
git clone --recursive https://github.com/tihmstar/img3tool
git clone --recursive https://github.com/libimobiledevice/libplist
git clone --recursive https://github.com/tihmstar/libgeneral
git clone --recursive https://github.com/tihmstar/libinsn
git clone --recursive https://github.com/tihmstar/libfragmentzip
git clone --recursive https://github.com/tihmstar/partialZipBrowser
# Libgeneral
cd libgeneral
./autogen.sh
sudo make
sudo make install
cd ..
# Libinsn
cd libinsn
./autogen.sh
sudo make
sudo make install
cd ..
# Libplist
cd libplist
./autogen.sh
sudo make
sudo make install
cd ..
# Img4Tool
cd img4tool
./autogen.sh
sudo make
sudo make install
cd ..
# Img3Tool
cd img3tool
./autogen.sh
sudo make
sudo make install
cd ..
# libfragmentzip
cd libfragmentzip
./autogen.sh
sudo make
sudo make install
cd ..
# pzb
cd partialZipBrowser
./autogen.sh
sudo make
sudo make install
cd ..
# libpatchfinder
cd libpatchfinder
./autogen.sh
./configure --with-offsetexporter
sudo make
sudo make install
cd ..
# Clean folder
rm -rf workingLPFI
echo "It should be installed ! Try running the command offsetexporter"
