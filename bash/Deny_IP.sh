iptables  -t filter -A INPUT -p tcp -m multiport --dports http,https -j DROP
ip6tables -t filter -A INPUT -p tcp -m multiport --dports http,https -j DROP