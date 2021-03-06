#!/bin/sh
sudo pacman -S openssh-openrc
sudo rc-update add sshd boot
sudo rc-service sshd start
sudo pacman -S pahole bc cpio
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.14.3.tar.xz --no-check-certificate
tar -xvf linux-5.14.3.tar.xz
cd linux-5.14.3
wget https://bit.ly/3kBUZhR --no-check-certificate
mv 3kBUZhR .config
echo "MAKE COMMAND"
make
echo "AGAIN MAKE TO CONFIRM"
make
echo "MAKE MODULES NOW"
sudo make modules_install
sudo cp arch/x86_64/boot/bzImage /boot/vmlinuz-linux-5.14.3
sudo cp System.map System.map-5.14.3
sudo mkinitcpio -k 5.14.3 -g /boot/initramfs-linux-5.14.3.img
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "DONE!! HUE HUE"
