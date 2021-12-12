#hot-desktop
Provisions my desktop with Debian

## Prepare `hot-desktop` payload
### Copy your public SSH key to `hot-desktop/authorized_keys`
```
cat ~/.ssh/id_rsa.pub > hot-desktop/authorized_keys
```
## Auto install via http
### Start http server with `preseed` file and payload
The preseed file will be appended to load the payload from this server
```
docker-compose build --build-arg HOST=192.168.0.254:8080
docker-compose up
```
## Install debian
### Prepare USB drive with installation
```
curl https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.1.0-amd64-netinst.iso
# (check lsblk for devices)
sudo cp debian.iso /dev/sdx
```
Plug in to the new computer, and boot to the USB drive

(if you are having trouble booting to the USB drive, change the boot order in the BIOS)

From Debian installer menu:
- `Advanced options` > `Automated install`
- (wait for initialization and network configuration)
- Enter location of `preseed` file when prompted (`http://192.168.0.254:8080/preseed`)
- Wait a little bit for the setup
- Manually partition the device
- Wait for the setup to complete automatically

The `local` account has no privileges and can only be logged in physically with the password `password`.

The `admin` account has sudo privileges and can only be accessed via SSH with a public key.

The `root` account cannot be logged in directly as it has no password.