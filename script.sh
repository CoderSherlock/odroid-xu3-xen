export PATH=${PATH}:$2

# flush linux system
# wget https://odroid.in/ubuntu_14.04lts/ubuntu-14.04lts-server-odroid-xu3-20150725.img.xz
# unxz ubuntu-14.04lts-server-odroid-xu3-20150725.img.xz
# sudo dd if=ubuntu-14.04lts-server-odroid-xu3-20150725.img of=$1 bs=1M conv=fsync
# sync

# flash bootloader
# git clone https://github.com/hardkernel/u-boot.git -b odroidxu3-v2012.07
# cd u-boot
# make odroid_config
# make ARCH=arm CROSS_COMPILE=arm-none-eabi- -j16
# cd sd_fuse/hardkernel
# sudo ./sd_fusing.sh $1
# sync
# cd ../../../

# mount sdcard 
# sudo mkdir /media/boot
# sudo mkdir /media/rootfs
# sudo mount $1"1" /media/boot
# sudo mount $1"2" /media/rootfs

# flush boot.ini
# wget http://git.io/vCu3c -O boot.ini
# sudo cp -f boot.ini /media/boot/
# sync

# flush xen
# git clone https://github.com/bkrepo/xen.git -b odroid-xu4
# cd xen
# make dist-xen CROSS_COMPILE=arm-none-eabi- XEN_TARGET_ARCH=arm32 debug=y CONFIG_EARLY_PRINTK=exynos5250 -j16
# sudo cp xen/xen /media/boot/
# sync
# cd ..

# flush domain0
# git clone https://github.com/bkrepo/linux-dom0.git
# cd linux-dom0
# make odroidxu3_xen_defconfig ARCH=arm
# make ARCH=arm CROSS_COMPILE=arm-none-eabi- -j16
# sudo make modules_install ARCH=arm INSTALL_MOD_PATH=/media/rootfs/
# sudo cp -f arch/arm/boot/zImage arch/arm/boot/dts/exynos5422-odroidxu3.dtb /media/boot/
# sync
# cd ..



sudo umount /dev/sdg1
sudo umount /dev/sdg2

