# Tor-unrar
System script for unpacking video files for processing by another application.

Run with systemd:
```
[Unit]
Description=tor-unrar.service file (unrars torrents for pickup)

[Service]
Type=oneshot
User=root
#required for immutable bit usage
ExecStart=/usr/bin/find /home/you/torrents -name "*.rar" -execdir /home/you/tor-unrar.sh "{}" \;
```
On a timer:
```
[Unit]
Description=tor-unrar.timer file (Run tor-unrar.service every 5 minutes)

[Timer]
OnCalendar=*:0/05
RemainAfterElapse=yes

[Install]
WantedBy=timers.target`
```
