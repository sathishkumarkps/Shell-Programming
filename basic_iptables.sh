#! /bin/bash
iptables -F
iptables -X
echo Allow ssh
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
echo Allow http and https
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
echo Allow pop, imap and smtp
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 465 -j ACCEPT
iptables -A INPUT -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -p tcp --dport 993 -j ACCEPT
iptables -A INPUT -p tcp --dport 587 -j ACCEPT
iptables -A INPUT -p tcp --dport 110 -j ACCEPT
iptables -A INPUT -p tcp --dport 995 -j ACCEPT
echo Allow icmp
iptables -A INPUT -p icmp -j ACCEPT
echo Allow local
iptables -A INPUT -s 127.0.0.1 -j ACCEPT
echo Allow connections already made
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
echo Reject all other traffic
iptables -A INPUT -j REJECT
iptables -A FORWARD -j REJECT
