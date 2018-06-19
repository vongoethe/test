source /etc/profile
git clone -b ip-lists git://github.com/gaoyifan/china-operator-ip.git /root/ip
wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | grep ipv4 | grep CN | awk -F\| '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > /root/ip/chnroute_tmp.txt
cat /root/ip/cernet.txt /root/ip/china.txt /root/ip/chinanet.txt /root/ip/cmcc.txt /root/ip/cstnet.txt /root/ip/drpeng.txt /root/ip/tietong.txt /root/ip/unicom.txt /root/ip/chnroute_tmp.txt| sort|uniq > /root/ip/china_ssr.txt
mv -f /root/ip/china_ssr.txt /etc/china_ssr.txt
rm -rf /root/ip
/etc/init.d/dnsmasq reload
