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
git clone --recursive https://github.com/tihmstar/libpatchfinder
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

# Is it installed ?
if command -v offsetexporter &> /dev/null; then
    # Clean folder
    rm -rf workingLPFI
    
    echo "Success ! offsetexporter was successfully installed. Please try running run.sh now."
    echo "you might need to add your Python bin to PATH."
else
    echo "offsetexporter wasn't installed properly. Please contact c22dev on Discord, or try updating script."
fi
echo "Job done !"
