git clone --depth=1 'https://github.com/eclipse/eclipse.jdt.ls'
sudo eclipse.jdt.ls/mvnw clean verify
sudo find . -exec chown xein {} \;
sudo find . -exec chgrp xein {} \;
sudo mkdir /usr/local/bin/langServers/eclipse.jdt.ls 
sudo mv eclipse.jdt.ls /usr/local/bin/langServers/eclipse.jdt.ls 
