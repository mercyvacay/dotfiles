#!bin/sh
# Packages to install on a new system

# fish - bash replacement
#  build-essential, cmake, python3-dev : Required for YouCompleteMe Plugin
packageList="vim fish build-essential cmake python3-dev"

for packageName in $packageList; do
  if ! (dpkg-query -W -f='${Status}' $packageName | grep "ok installed" > /dev/null)
  then
    sudo apt-get install -y $packageName
  fi
done
