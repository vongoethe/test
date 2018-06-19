source /etc/profile
git clone --depth=1 git://git.coding.net/felixonmars/dnsmasq-china-list.git /root/chinadns
mv -f /root/chinadns/accelerated-domains.china.conf /etc/dnsmasq.d
rm -rf /root/chinadns
/etc/init.d/dnsmasq reload
