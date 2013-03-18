#!/tmp/busybox sh
source='/tmp/su/su-2.3.6.1-ef'
dest='/system/xbin/su'

if /tmp/busybox [ ! -f /system/xbin/su ]; 
then

/tmp/busybox mount -o remount,rw /dev/block/mmcblk0p8 /system
/tmp/busybox mkdir -p /system/xbin
	/tmp/busybox cp $source $dest
	# make sure it's owned by root
	/tmp/busybox chown 0.0 $dest
	# sets the suid permission
	/tmp/busybox chmod 06755 $dest
/tmp/busybox mount -o remount,ro /system
fi;
