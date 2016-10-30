#!/bin/sh

iptables -F

# 001 default policies:
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# 002 allow loopback:
iptables -A INPUT -i lo -s 127.0.0.0/8 -d 127.0.0.0/8 -j ACCEPT

# 100 allow established related:
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 200 allow ssh:
# iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -p tcp --dport ssh -m state --state NEW -m recent --set -j ACCEPT
iptables -A INPUT -p tcp --dport ssh -m state --state NEW -m recent --update --seconds 60 --hitcount 6 -j DROP
iptables -A INPUT -p tcp --dport http -j ACCEPT
iptables -A INPUT -p tcp --dport https -j ACCEPT

# 999 drop everything:
iptables -P INPUT DROP
