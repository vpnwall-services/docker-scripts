#!/bin/bash
# Most of this is credited to
# https://trac.torproject.org/projects/tor/wiki/doc/TransparentProxy
# With a few minor edits

# to run iptables commands you need to be root
if [ "$EUID" -ne 0 ]; then
	echo "Please run as root."
	return 1
fi
### set variables
# destinations you don't want routed through Tor
_non_tor="192.168.1.0/24 192.168.0.0/24"
# get the UID that Tor runs as
_tor_uid=$(docker exec -u tor tor id -u)
# Tor's TransPort
_trans_port="9040"
_dns_port="5353"
### set iptables *nat
iptables -t nat -A OUTPUT -m owner --uid-owner $_tor_uid -j RETURN
iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports $_dns_port
# allow clearnet access for hosts in $_non_tor
for _clearnet in $_non_tor 127.0.0.0/9 127.128.0.0/10; do
iptables -t nat -A OUTPUT -d $_clearnet -j RETURN
done
# redirect all other output to Tor's TransPort
iptables -t nat -A OUTPUT -p tcp --syn -j REDIRECT --to-ports $_trans_port
### set iptables *filter
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# allow clearnet access for hosts in $_non_tor
for _clearnet in $_non_tor 127.0.0.0/8; do
iptables -A OUTPUT -d $_clearnet -j ACCEPT
done
# allow only Tor output
iptables -A OUTPUT -m owner --uid-owner $_tor_uid -j ACCEPT
iptables -A OUTPUT -j REJECT
