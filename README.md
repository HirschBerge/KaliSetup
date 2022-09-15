# KaliSetup
Run to set up with my preferred scripts, functions, and installed software
To install everything you need:
```
git clone https://github.com/HirschBerge/KaliSetup.git /opt/setup
cd /opt/setup
sudo bash setup.sh
```

# Useful functions and aliases:

`changetarget <IPADDR>` allows you to export your current target IP so you can use it as a variable later on in your commands. For example

`nmap -A -T4 -sV -sC $TARGET --script vuln -p 8080 -oA nmap/nmap`
`gcat` allows you to use grc's color adding functionality to easierly (is that a word?) parse through your logs. for example

`gcat nmap/nmap.nmap`

`shadowy` takes two files in your `$PWD`; `shadow` and `passwd` and uses john w/ rockyou to try and crack them
example: `shadowy`

`mkd` makes a directory and cd's into it

Example: `mkd ~/Examples/targetattack/nmap` 

`qnfo` gathers some quick information on a targetted IP. Including ping, traceroute, and quick nmap scan
`qnfo 10.10.10.10`

`ex` will extract a various number of types of compressed files, .zip .gz *.tar etc etc.
Usage: 
`ex compressed.gz`

`sourceZsh` and `zshrc` the former will do what you think it does, the latter will open ~/.zshrc for editing and source it when you're done.

# Useful variables
 `$TARGET` we have covered along with the `changetarget` function
 `TUNIP` is your VPN IP you can `echo $TUNIP` to see your current IP, you can also use it in commands, such as when creating a reverse shell payload
 `LOCIP` same as above, except less useful generally.

# Important
If you open a new terminal window, or source your ~/.zshrc it will automatically try and connect you to VPN. Remember to change the `vpns` alias to reflect to where your OpenVPN file from THM is located so that it works.