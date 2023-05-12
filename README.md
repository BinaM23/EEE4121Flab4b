# EEE4121F lab 4 SDN firewall and P4 Routing

## Pre-requisites

It is assumed the code will be run on a VM or PC with mininet and the appropriate python modules installed.
Assumes the mininet VM being used has POX controller and misc folder containing the necessary files


## PART 1 SDN FIREWALL

### 1. Setup
1. Unzip the submitted zip folder into directory of your choice. `cd` to the directory where the firewall prac files are located It should contain `firewall.py`,`sdn.py` and `run.sh` files.
2. Run the command `sudo mn -c` to clear the network before executing any script to kill any controllers or processes which may not have terminated properly. 
3. If you haven't already, run `sudo chmod +x *.py` to make all pyhton files executible if they aren't already.
4. Run `sudo chmod +x run.sh` to make the `run.sh` file executible if it isn't already.
5. copy the `firewall.py` from the current directory into `pox/pox/misc` directory as root i.e. run a command like `sudo cp firewall.py path/to/pox/pox/misc/directory`

### 2. Running the firewall
1. To run an experiment, run the command `sudo ./run.sh` on the terminal. Then provide the password for that VM if prompted. This will activate the POX controller in the current terminal and invoke the `sdn.py` script in a new terminal.

2. Swicth to this new terminal and provide the password for the VM if prompted, otherwise the network will activate itself and the firewall will be active. Once it finishes execution the script will automatcally clean up the network and close it. 

3. Swicth back to the terminal that started the controller and run `ctrl+c` to close the controller then run `sudo pkill -f pox.py` then `sudo mn -c` to clear the network. Can make changes according to section 3 then repeat step 1 to 3 above to use the firewall for different blocked hosts.

### 3. Choosing hosts to block

To change the hosts which get blocked:
1. simply cd to the `misc` directory located in the `pox/pox` directory then run `sudo gedit firewall.py` to open the firewall pyscript as root.

2. Change the indices of the array slice in line 28 `host_Addresses2=host_Addresses[a:b]` to whatever indices correspond to the particular host MAC addresses you want to block. e.g. to block h1 and h2 the indices of the slice should be `[0:2]` alternatively open the `firewall-policies.csv` file as sudo and add or remove hosts you want to block then leave line 28 as `host_Addresses2=host_Addresses[:]` to process all addresses in the csv file.

3. Save changes then `cd` back to the directory containing the `run.sh` file then follow the steps in section 2.
