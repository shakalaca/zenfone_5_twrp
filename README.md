TWRP for ZenFone 5
==============

Build TWRP 2.7 with CM 10.2 from source (reference others/BoardConfig.mk)

### default.prop

```
ro.secure=0
ro.adb.secure=0
ro.allow.mock.location=1
ro.debuggable=1
```

and other property from system/build.prop

### init.rc

```
service killservices /sbin/killservices.sh
    oneshot
```

- remove unused /dev/input/event*, left power/volume/touchscreen
- umount all partitions except /cache, /data & /dev
- kill system services and daemonsu

### adbon.sh

- show indicator LED
- check if volume key was pressed
- make / writable and remove /etc (use our own) & /sdcard (use by twrp)
- un-tar twrp recovery
- restart init
