#!/sbin/sh
mount /system
mount /vendor
mount /data
mount -o rw,remount /system
mount -o rw,remount /system /system
mount -o rw,remount /
mount -o rw,remount / /
mount /system_root
mount -o rw,remount /system_root
mount -o rw,remount /system_root /system_root
