# Note: This is for Debian based systems (Ubuntu, Mint, ..)
## 1) chmod +x <filename.sh>
## 2) ./<filename.sh>

installation_folder=$HOME/Aranock
launcher=Aranock.exe

# Downloading
echo $'\e[1;33m'[-]Launching download script$'\e[0m'
echo $'\e[1;34m'[*]Starting download of essential files$'\e[0m'
sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install wine32 -y && sudo apt install wget -y && sudo apt install icoutils -y
echo $'\e[1;32m'[+]Download complete$'\e[0m'
echo $'\e[1;34m'[*]Downloading Aranock Online$'\e[0m'
mkdir $installation_folder && cd $_
wget http://aranockonline.com/download/aranock-online.zip
echo $'\e[1;32m'[+]Download complete$'\e[0m'
echo $'\e[1;34m'[*]Extracting files$'\e[0m'
unzip aranock-online.zip
echo $'\e[1;32m'[+]Extraction complete$'\e[0m'

# Setting up configuration
echo $'\e[1;33m'[-]Configuring files$'\e[0m'
echo $'\e[1;34m'[*]Creating desktop shortcut$'\e[0m'
wrestool -x --output=aranock.ico -t14 $launcher
echo "[Desktop Entry]
Version=1.0
Name=Aranock
GenericName='Aranock Online'
Exec='wine $installation_folder/$launcher'
Terminal=false
Icon=$installation_folder/aranock.ico
Type=Application
Categories=Game" > Aranock.desktop
chmod +x Aranock.desktop
sudo cp -v Aranock.desktop /usr/share/applications/
cp -v Aranock.desktop $HOME/Desktop/ && rm Aranock.desktop 
echo $'\e[1;32m'[+]Desktop shortcut created$'\e[0m'
echo $'\e[1;34m'[*]Setting screen size$'\e[0m'
xrandr -s 800x600 
echo $'\e[1;32m'[+]Resolution set to 800*600$'\e[0m'

# Launch game
echo $'\e[1;32m'[+]Game is ready$'\e[0m'
echo $'\e[1;33m'[-]Run the game with "wine Aranock.exe" and click on close for the error$'\e[0m'
echo $'\e[1;33m'[-]Or through your desktop launcher$'\e[0m'
