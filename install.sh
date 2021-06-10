#this file installs viw and all it's dependencies
#this file currently only works on linux
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
if [[ $machine -eq "Linux"]] 
then
  sudo apt update
  sudo apt install libgirepository1.0-dev gcc libcairo2-dev pkg-config python3-dev gir1.2-gtk-3.0 gir1.2-webkit2-4.0
  pip3 install pycairo
  pip3 install pygobject
  git clone https://github.com/ninjamar/viw
  sudo echo 'alias viw=~"python3 /viw/viw/viw.py"' >> ~/.bashrc
  sudo source ~/.bashrc