#/bin/sh
iptables-nft -t nat -C POSTROUTING -o usb0 -j MASQUERADE || iptables-nft -t nat -A POSTROUTING -o usb0 -j MASQUERADE
iptables-nft -C FORWARD -i usb0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT || iptables-nft -A FORWARD -i usb0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables-nft -C FORWARD -i wlan0 -o usb0 -j ACCEPT || iptables-nft -A FORWARD -i wlan0 -o usb0 -j ACCEPT
