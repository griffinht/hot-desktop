#debian

## Auto install via http
### Start http server with preseed file and other scripts
```
docker-compose build --build-arg HOST=192.168.0.254:8080
docker-compose up
```
```
curl 192.168.0.254:8080/preseed
```
## Install debian
### Prepare USB drive with installation
```
curl https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.1.0-amd64-netinst.iso
# (check lsblk for devices)
sudo cp debian.iso /dev/sdx
```
Plug in to the new computer, and boot to the USB drive

From installer menu:
- Advanced options > Automated install
- (wait for network configuration)
- enter location of `preseed` file when prompted (`http://192.168.0.254:8080/preseed`)