#!/bin/bash

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/b‌​in


DIR="/srv/unifi-video/videos"

# Cek directory ada
if [ ! -d "$DIR" ]; then
  echo "directory $DIR tidak ada."
  exit 1
fi

# cari directory ter lama
oldest=$(find "$DIR" -mindepth 3 -maxdepth 3 -type d -printf '%T+ %p\n' | sort -T /srv/tmp | head -n 3)

# Cek file atau directory ada
if [ -z "$oldest" ]; then
  echo "No files or directories found inside $DIR."
  exit 1
else
  echo "The three oldest files or directories inside $DIR are:"
  echo "$oldest" 
fi

echo ""
echo "delete oldest directory inside"
echo ""

#prompt penghapusan
echo "$oldest" | awk '{print $2}' | xargs rm -rv
echo "deleted...!"
