###############################
##Ports used for wowza server##
###############################

# RTMP (all variants), RTSP, Microsoft Smooth Streaming, Apple HTTP Live Streaming (HLS)
/sbin/iptables -A INPUT -p tcp --dport 1935 -j ACCEPT

# RTP UDP Streaming
/sbin/iptables -A INPUT -p udp --dport 6970:9999 -j ACCEPT

# JMX/JConsole monitoring and administration
/sbin/iptables -A INPUT -p tcp --dport 8084:8085 -j ACCEPT

# HTTP administration
/sbin/iptables -A INPUT -p tcp --dport 8086 -j ACCEPT

# RTMPT, Microsoft Smooth Streaming, Apple HTTP Live Streaming (HLS), Adobe HTTP Dynamic Streaming (HDS)
/sbin/iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# RTMPS, HTTPS
/sbin/iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# RTSP
/sbin/iptables -A INPUT -p tcp --dport 554 -j ACCEPT




