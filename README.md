# Airchain Node Setup Script
The Airchain Node Setup Script automates the installation and configuration of essential components to deploy an Airchain node environment.

## System Requirements

This script assumes you already have a VPS or Docker container. It is suitable for Ubuntu/Linux systems.

![image](https://github.com/ZenCryptoMind/AirchainScript/assets/173910157/ce142925-2db7-4521-988b-29e3eb4342f0)


## Script Usage Instructions

1. Install Git if not already installed:
```
sudo apt update
sudo apt install git -y
```

2. Clone the GitHub repository
```
https://github.com/ZenCryptoMind/AirchainScript.git
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
```
junctiond init <moniker>
```
**Replace <moniker> with a name for your node. This name can be anything you choose and will be used to identify your node in the network.**



