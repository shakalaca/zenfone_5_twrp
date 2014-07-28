#!/sbin/sh

# umount unneccessary partitions
umount -l /data/data/ASUSBrowser/cache
umount -l /Removable
umount -l /mnt/secure
umount -l /mnt/asec
umount -l /mnt/obb
umount -l /mnt/shell/emulated

umount -l /dev/block/mmcblk0p3		# /factory
umount -l /dev/block/mmcblk0p5		# /config
umount -l /dev/block/mmcblk0p8		# /ADF
umount -l /dev/block/mmcblk0p9		# /system

# remove unused input devices
rm /dev/input/event0
#  rm /dev/input/event1	# touch
rm /dev/input/event2	
rm /dev/input/event3
rm /dev/input/event4
#  rm /dev/input/event5	# volume	
rm /dev/input/event6
#  rm /dev/input/event7	# power
rm /dev/input/event8

# kill system services
ps | grep /system/bin/ | grep -v grep | awk '{print $1}' | xargs kill -9

# kill su daemon
ps | grep daemonsu | grep -v grep | awk '{print $1}' | xargs kill -9
