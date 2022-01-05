# hp envy
https://wiki.debian.org/InstallingDebianOn/HP/Envy%2014%20Beats%20Edition%202020ep

the installer can't detect the LAN card, so do the following:

when you are prompted for the location of the preseed file in the installer

1. Drop to a shell (alt + F2)
2. Execute the following commands
```
modprobe atl1c
echo "1969 1083" > /sys/bus/pci/drivers/atl1c/new_id
```
3. Continue with normal install (alt + F1)