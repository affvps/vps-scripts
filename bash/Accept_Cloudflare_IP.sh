# 对 Cloudflare 的 ip 进行白名单放行

# ipv4
accept-v4(){
iptables  -t filter -A INPUT -p tcp -m multiport --dports http,https -s $1 -j ACCEPT
}

# ipv6
accept-v6(){
ip6tables -t filter -A INPUT -p tcp -m multiport --dports http,https -s $1 -j ACCEPT
}

accept-v4 173.245.48.0/20
accept-v4 103.21.244.0/22
accept-v4 103.22.200.0/22
accept-v4 103.31.4.0/22
accept-v4 141.101.64.0/18
accept-v4 108.162.192.0/18
accept-v4 190.93.240.0/20
accept-v4 188.114.96.0/20
accept-v4 197.234.240.0/22
accept-v4 198.41.128.0/17
accept-v4 162.158.0.0/15
accept-v4 104.16.0.0/12
accept-v4 172.64.0.0/13
accept-v4 131.0.72.0/22
accept-v6 2400:cb00::/32
accept-v6 2606:4700::/32
accept-v6 2803:f800::/32
accept-v6 2405:b500::/32
accept-v6 2405:8100::/32
accept-v6 2a06:98c0::/29
accept-v6 2c0f:f248::/32

echo "success!"