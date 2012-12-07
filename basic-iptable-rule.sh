#Basic Iptable entries 

# Block Brute Force Attack

/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 -j DROP
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
/sbin/iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT

# Allow HTTP and HTTPS

/sbin/iptables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT

# Clear all rules

/sbin/iptables -F

# Streaming Rules 
#
# RTMP 
#
/sbin/iptables -A INPUT -p tcp --dport 1935 -m state --state NEW,ESTABLISHED -j ACCPET  

