#!/bin/bash

# /etc/fstab
# tmpfs   /mnt/RAMDISK    tmpfs   rw,size=4G      0       0

# /etc/sudoers.d/$USER
# $USER ALL=(ALL) NOPASSWD: /usr/bin/nice
# $USER ALL=(ALL) NOPASSWD: /bin/nice

mkdir -p /mnt/RAMDISK/RAMFirefox
cp -r /usr/lib/firefox-esr /mnt/RAMDISK/RAMFirefox

# TODO:
# Fix the "firefox is running" problem
cat <<'EOF' > /mnt/RAMDISK/RAMFirefox/RAMFirefox.sh
#!/bin/bash
FIREFOX_HOME=/mnt/RAMDISK/RAMFirefox/firefox-esr
FIREFOX_PROFILE=~/.mozilla/firefox/1.default-esr
MOZILLA_FIREFOX_PATH=$FIREFOX_HOME/firefox-esr
sudo nice -n -20 sudo -u $USER $MOZILLA_FIREFOX_PATH -profile $FIREFOX_PROFILE 1>/dev/null 2>/dev/null & disown
EOF

chmod u+x /mnt/RAMDISK/RAMFirefox/RAMFirefox.sh
