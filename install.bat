#!/bin/sh
adb wait-for-device
adb push update/system/xbin/busybox /data/local/tmp
adb push update/system/bin/recovery.tar /data/local/tmp
adb push update/system/bin/adbon.sh /data/local/tmp

adb shell su -c 'mount -o rw,remount /system'

adb shell su -c 'cp /data/local/tmp/adbon.sh /system/bin'
adb shell su -c 'chown root.shell /system/bin/adbon.sh'
adb shell su -c 'chmod 755 /system/bin/adbon.sh'

adb shell su -c 'cp /data/local/tmp/busybox /system/xbin'
adb shell su -c 'chown 0.0 /system/xbin/busybox'
adb shell su -c 'chmod 755 /system/xbin/busybox'

adb shell su -c 'cp /data/local/tmp/recovery.tar /system/bin'
adb shell su -c 'chown 0.0 /system/bin/recovery.tar'
adb shell su -c 'chmod 644 /system/bin/recovery.tar'

adb reboot
