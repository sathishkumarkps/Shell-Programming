##############################
## Block Brute Force Attack ##
##############################

/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 -j DROP
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT

# Finally save the iptable rules
