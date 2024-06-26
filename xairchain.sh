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

echo "✅ You might received the Ignite error, ignore it"
