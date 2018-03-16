# vps-scripts
脚本来自网络收集，并按照本人使用习惯进行部分修改  
感谢网络上的大佬们，同时欢迎其他人转载使用本人修改的脚本  
## add-swap  
此脚本可以一键增加500M Swap  
https://github.com/nanqinlang/swap-add/blob/master/swap-add.sh  
https://github.com/liangxyz/testrace/blob/master/swap.sh  
* 使用方法  
<pre><code>wget https://raw.githubusercontent.com/lmc920/vps-scripts/master/add-swap/add-swap.sh && bash add-swap.sh</pre></code>
* 特殊小小鸡  
如果遇到某些特殊小鸡过于营养不良导致可用空间不足500M，请使用以下命令增加你需要的Swap容量，例如256M
<pre><code>dd if=/dev/zero of=/swapfile bs=1M count=256 && \
chmod 600 /swapfile  && \
mkswap /swapfile  && \
swapon /swapfile  && \
cp /etc/fstab /etc/fstab.bak && \
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab && \
sysctl vm.swappiness=10 && \
sysctl vm.vfs_cache_pressure=50 && \
echo vm.swappiness = 10 >> /etc/sysctl.conf && \
echo vm.vfs_cache_pressure=50 >> /etc/sysctl.conf && \
sysctl -p</pre></code>
## zbench  
修改自ZBench脚本  
https://github.com/FunctionClub/ZBench/  
* 使用方法  
<pre><code>wget https://raw.githubusercontent.com/lmc920/vps-scripts/master/zbench/ZBench.sh && bash ZBench.sh
wget https://raw.githubusercontent.com/lmc920/vps-scripts/master/zbench/ZBench-CN.sh && bash ZBench-CN.sh</pre></code>
## speedtest
<pre>wget https://raw.githubusercontent.com/lmc920/vps-scripts/master/speedtest/speedtest.py
chmod a+rx speedtest.py
mv speedtest.py /usr/local/bin/speedtest
chown root:root /usr/local/bin/speedtest
speedtest</pre>

## bench 
<pre>wget https://raw.githubusercontent.com/lmc920/vps-scripts/master/bench/bench.sh && bash bench.sh

官方方法：
<pre>wget -qO- bench.sh | bash
curl -Lso- bench.sh | bash</pre>
