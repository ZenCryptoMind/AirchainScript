# Airchain Node Setup Script
The Airchain Node Setup Script automates the installation and configuration of essential components to deploy an Airchain node environment.

## System Requirements

This script assumes you already have a VPS, Docker container or a working Device. It is suitable for Ubuntu/Linux systems.

![image](https://github.com/ZenCryptoMind/AirchainScript/assets/173910157/ce142925-2db7-4521-988b-29e3eb4342f0)


## Script Usage Instructions

1. Install Git if not already installed:
```
sudo apt update
sudo apt install git -y
```

2. Clone the GitHub repository
```
git clone https://github.com/ZenCryptoMind/AirchainScript.git
```

3. Navigate into the cloned directory
```
cd AirchainScript
```

4. Make the script executable
```
chmod +x xairchain.sh
```

5. Run the script
```
./xairchain.sh
```

## Node Configurations

If you have followed the previous steps and everything has worked correctly, you can now proceed with these steps

6. Initialize your node with a moniker

**Replace <moniker> with a name for your node. This name can be anything you choose and will be used to identify your node in the network.-> "junctiond init TestNode1"**
```
junctiond init <moniker>
```

7. Edit the configuration file to set persistent peers
```
nano ~/.junction/config/config.toml
```
**Use the arrow keys to scroll down to the [p2p] section. It might look something like "persistent_peers = "**

**Modify the persistent_peers line to include your peer**

**This step ensures your node connects to the specified peer in the network.**
```
persistent_peers ="0fc70473e7ee84b77ebcb1c098d457379931bc0a@88.99.61.53:38656,eb4d2c546be8d2dc62d41ff5e98ef4ee96d2ff29@46.250.233.5:26656,086d19f4d7542666c8b0cac703f78d4a8d4ec528@135.148.232.105:26656,e09fa8cc6b06b99d07560b6c33443023e6a3b9c6@65.21.131.187:26656,0305205b9c2c76557381ed71ac23244558a51099@162.55.65.162:26656,7d6694fb464a9c9761992f695e6ba1d334403986@164.90.228.66:26656,b2e9bebc16bc35e16573269beba67ffea5932e13@95.111.239.250:26656,23152e91e3bd642bef6508c8d6bd1dbedccf9e56@95.111.237.24:26656,c1e9d12d80ec74b8ddbabdec9e0dad71337ba43f@135.181.82.176:26656,3b429f2c994fa76f9443e517fd8b72dcf60e6590@37.27.11.132:26656,84b6ccf69680c9459b3b78ca4ba80313fa9b315a@159.69.208.30:26656"
```

8. This command uses sed to find and replace the persistent_peers line in the configuration file with the specified peers, creating a backup of the original file.
```
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$peers\"/" ~/.junction/config/config.toml
```

9. Edit the app.toml configuration file to set the minimum gas prices
```
cat ~/.junction/config/app.toml | grep minimum-gas-prices
```
**Find the line that starts with minimum-gas-prices and set it as follows**
```
minimum-gas-prices = "0.00025amf"
```

10. Start your node
```
junctiond start
```

**After completing all the steps, you need to let the node run for about 10-20 minutes. During this time, you might receive notifications indicating that the node is having trouble connecting. You can ignore these messages initially. After 10-20 minutes, you should see many messages appearing, and the height should be changing. This indicates that the node is syncing.**

## Troubleshooting
