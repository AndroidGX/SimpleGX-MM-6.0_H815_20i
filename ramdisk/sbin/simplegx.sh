#!/system/bin/sh
# SimpleGX KERNEL init script


BB=/sbin/busybox

$BB mount -t rootfs -o remount,rw rootfs

sync


# -------------
# Cleaning part
# -------------
$BB rm -rf /cache/lost+found/* 2> /dev/null;
$BB rm -rf /data/lost+found/* 2> /dev/null;
$BB rm -rf /data/tombstones/* 2> /dev/null;


# ------------------
# Initialize BusyBox
# ------------------
$BB chmod 06755 /system/xbin/busybox
./system/xbin/busybox --install -s /system/xbin/


# ---------------
# Initialize root
# ---------------
/system/xbin/daemonsu --auto-daemon &


# ----------------------
# Fix init.d permissions
# ----------------------
$BB chown -R root.root /system/etc/init.d
$BB chmod -R 755 /system/etc/init.d
$BB chmod 755 /system/etc/init.d/*

$BB run-parts /system/etc/init.d/


# ------------------------------------------
# Stop google service and restart it on boot
# ------------------------------------------

if [ "$($BB pidof com.google.android.gms | wc -l)" -eq "1" ]; then
	$BB kill "$($BB pidof com.google.android.gms)";
fi;
if [ "$($BB pidof com.google.android.gms.unstable | wc -l)" -eq "1" ]; then
	$BB kill "$($BB pidof com.google.android.gms.unstable)";
fi;
if [ "$($BB pidof com.google.android.gms.persistent | wc -l)" -eq "1" ]; then
	$BB kill "$($BB pidof com.google.android.gms.persistent)";
fi;
if [ "$($BB pidof com.google.android.gms.wearable | wc -l)" -eq "1" ]; then
	$BB kill "$($BB pidof com.google.android.gms.wearable)";
fi;


# ---------------------------------------------------
# Google Services battery drain fixer by Alcolawl@xda
# ---------------------------------------------------

pm enable com.google.android.gms/.update.SystemUpdateActivity
pm enable com.google.android.gms/.update.SystemUpdateService
pm enable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver
pm enable com.google.android.gms/.update.SystemUpdateService$Receiver
pm enable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver
pm enable com.google.android.gsf/.update.SystemUpdateActivity
pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity
pm enable com.google.android.gsf/.update.SystemUpdateService
pm enable com.google.android.gsf/.update.SystemUpdateService$Receiver
pm enable com.google.android.gsf/.update.SystemUpdateService$SecretCodeReceiver


$BB mount -t rootfs -o remount,ro rootfs
$BB mount -o remount,rw /data

