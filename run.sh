#!/bin/bash

# Note: Mininet must be run as root.  So invoke this shell script
# using sudo.

#loads the 2 python modules l2 learning and firewall.py into the OF controller
echo "setting up controller and firewall"
~/pox/pox.py forwarding.l2_learning misc.firewall2 &

echo "creating network in other window"
gnome-terminal -x sh -c "cd ~/mininet/lab4/eee4121f-b-lab2-sdn/firewall | sudo python sdn.py; exec bash"

echo "finished"
