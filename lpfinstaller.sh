clear
echo "LibPatchFinderInstaller v0.1 - made by c22dev\nThis should help you install libpatchfinder. Please make sure brew and Xcode Command Line tools are installed.\nThis script needs sudo to work. Please enter your mac password."
sudo echo "Sudoed successfuly !"
echo "Installing autoconf, automake, libtool, pkg-config, openssl"
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
    brew uninstall python & brew uninstall python3
    echo "Installing python again..."
    brew install python
 fi
mkdir workingLPFI
cd workingLPFI
echo "Cloning libpatchfinder and dependencies..."
git clone --recursive https://github.com/tihmstar/libpatchfinder
git clone --recursive https://github.com/tihmstar/img4tool
git clone --recursive https://github.com/tihmstar/img3tool
git clone --recursive https://github.com/libimobiledevice/libplist
git clone --recursive https://github.com/tihmstar/libgeneral
git clone --recursive https://github.com/tihmstar/libinsn
cd libgeneral
./autogen.sh
sudo make
sudo make install
cd ../
echo "WARNING FROM SCRIPT : This package (libinsn) doesnt seem to build correctly on some devices. Instead, you may want to try copy release content from the package's repo to your / directory." 
cd libinsn
./autogen.sh
sudo make
sudo make install
cd ../
cd libplist
./autogen.sh
sudo make
sudo make install
cd ../
cd img4tool
./autogen.sh
sudo make
sudo make install
cd ../
cd img3tool
./autogen.sh
sudo make
sudo make install
cd ../
cd libpatchfinder
./autogen.sh
./configure --with-offsetexporter
sudo make
sudo make install
cd ../
rm -rf workingLPFI
echo "It should be installed ! Try running the command offsetexporter"
