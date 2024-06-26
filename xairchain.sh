#!/bin/bash

# Print ASCII art
cat << 'EOF'

                                                                                               
         ,----,                                                                                
       .'   .`|                      ,----..                                 ___               
    .'   .'   ;                     /   /   \                  ,-.----.    ,--.'|_             
  ,---, '    .'              ,---, |   :     :  __  ,-.        \    /  \   |  | :,'    ,---.   
  |   :     ./           ,-+-. /  |.   |  ;. /,' ,'/ /|        |   :    |  :  : ' :   '   ,'\  
  ;   | .'  /   ,---.   ,--.'|'   |.   ; /--` '  | |' |   .--, |   | .\ :.;__,'  /   /   /   | 
  `---' /  ;   /     \ |   |  ,"' |;   | ;    |  |   ,' /_ ./| .   : |: ||  |   |   .   ; ,. : 
    /  ;  /   /    /  ||   | /  | ||   : |    '  :  /, ' , ' : |   |  \ ::__,'| :   '   | |: : 
   ;  /  /--,.    ' / ||   | |  | |.   | '___ |  | '/___/ \: | |   : .  |  '  : |__ '   | .; : 
  /  /  / .`|'   ;   /||   | |  |/ '   ; : .'|;  : | .  \  ' | :     |`-'  |  | '.'||   :    | 
./__;       :'   |  / ||   | |--'  '   | '/  :|  , ;  \  ;   : :   : :     ;  :    ; \   \  /  
|   :     .' |   :    ||   |/      |   :    /  ---'    \  \  ; |   | :     |  ,   /   `----'   
;   |  .'     \   \  / '---'        \   \ .'            :  \  \`---'.|      ---`-'             
`---'          `----'                `---`               \  ' ;  `---`                         
                                                          `--`                                 

EOF

# Function to center text
center() {
    local termwidth
    termwidth=$(tput cols)
    local padding
    padding=$(printf '%0.1s' "="{1..500})
    printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}

# Header
echo '=============================================================='
echo ''

# Centered line
center '🚀 Airchain Script by ZenCryptoMind 🚀'

# Other lines
echo ''
echo '🐦 Follow us on Twitter: @ZenCryptoMind 🐦'
echo ''
echo '📅 Updated: 2024 📅'

# Footer
echo ''
echo '=============================================================='

# Update system and install necessary packages
echo "🔄 Updating the system and installing necessary packages..."
sudo apt update -y && sudo apt upgrade -y

# Check if the update and upgrade were successful
if [ $? -ne 0 ]; then
    echo "❌ Failed to update and upgrade the system. Exiting."
    exit 1
fi

# Install curl and tmux
echo "🔄 Installing curl and tmux..."
sudo apt install curl tmux -y


# Install Ignite
echo "🔄 Installing Ignite..."
wget https://github.com/ignite/cli/releases/download/v0.27.1/ignite_0.27.1_linux_amd64.tar.gz
tar -xvf ignite_0.27.1_linux_amd64.tar.gz
sudo mv ignite /usr/local/bin
ignite version

# Install Go
echo "🔄 Installing Go..."
wget https://dl.google.com/go/go1.20.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz

# Check if Go installation was successful
if [ $? -ne 0 ]; then
    echo "❌ Failed to install Go. Exiting."
    exit 1
fi

# Add Go binary directory to PATH
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Display Go version
go version


# Firewall setup (UFW)
echo "🔒 Configuring firewall (UFW)..."
sudo apt-get install ufw -y

# Enable UFW and allow necessary ports
sudo ufw enable -y
sudo ufw allow 26657/tcp
sudo ufw allow 1317/tcp
sudo ufw allow 26656/tcp
sudo ufw allow 4500/tcp

# Display UFW status for verification
echo "ℹ️ Firewall (UFW) status:"
sudo ufw status verbose

echo "✅ Installation complete."
