#!/bin/bash

toolsFolder=/opt/tools

#Check if /opt/tools exists
if [ -d $toolsFolder ] ; then
    echo "$toolsFolder Directory already exist"
else
    sudo mkdir $toolsFolder  
fi

# Install go
sudo apt install golang

# set go and python binary to PATH
if grep 'PATH=$HOME/go' ~/.zshrc ; then
    echo '.zshrc PATH already exist'
else
    echo 'Add golang and python PATH to .zshrc'
    echo 'export PATH=$HOME/go/bin:$HOME/.local/bin:$PATH' >> ~/.zshrc
fi

if grep 'PATH=$HOME/go' ~/.bashrc ; then
    echo '.bashrc go PATH already exist'
else
    echo 'Add golang and python PATH to .bashrc'
    echo 'export PATH=$HOME/go/bin:$HOME/.local/bin:$PATH' >> ~/.bashrc
fi

# httpx
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# gau
go install github.com/lc/gau/v2/cmd/gau@latest

#subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

#seclists
if [ -d "/usr/share/seclists" ] ; then
    echo "/usr/share/seclists Directory already exist"
else
    sudo git clone https://github.com/danielmiessler/SecLists.git  /usr/share/seclists 
fi

#ffuf
go install github.com/ffuf/ffuf/v2@latest

#waybackurls
go install github.com/tomnomnom/waybackurls@latest

#ParamSpider
if [ -d "$toolsFolder/paramspider" ] ; then
    echo "$toolsFolder/paramspider Directory already exist"
else
    sudo git clone https://github.com/devanshbatham/paramspider $toolsFolder/paramspider
    cd $toolsFolder/paramspider
    sudo pip install .
fi

#SecretFinder
if [ -d "$toolsFolder/secretfinder" ] ; then
    echo "$toolsFolder/secretfinder Directory already exist"
else
    sudo git clone https://github.com/m4ll0k/SecretFinder.git $toolsFolder/secretfinder
    cd $toolsFolder/secretfinder
    sudo pip install -r requirements.txt
fi

#parth
pip3 install parth

#nuclei
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
