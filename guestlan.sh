NETWORKID=guest;FIREWALLZONE=guestzone;\
uci batch <<EOF
  set network.${NETWORKID}=interface
  set network.${NETWORKID}.ifname=${NETWORKID}
  set network.${NETWORKID}.proto=static
  set network.${NETWORKID}.ipaddr=192.168.3.1
  set network.${NETWORKID}.netmask=255.255.255.0
  set network.${NETWORKID}.ip6assign='60'
  set dhcp.${NETWORKID}=dhcp
  set dhcp.${NETWORKID}.interface=${NETWORKID}
  set dhcp.${NETWORKID}.start=100
  set dhcp.${NETWORKID}.leasetime=12h
  set dhcp.${NETWORKID}.limit=150
  set dhcp.${NETWORKID}.dhcpv6=server
  set dhcp.${NETWORKID}.ra=server
  set firewall.${FIREWALLZONE}=zone
  set firewall.${FIREWALLZONE}.name=${FIREWALLZONE}
  set firewall.${FIREWALLZONE}.network=${NETWORKID}
  set firewall.${FIREWALLZONE}.forward=REJECT
  set firewall.${FIREWALLZONE}.output=ACCEPT
  set firewall.${FIREWALLZONE}.input=REJECT 
  set firewall.${FIREWALLZONE}_fwd=forwarding
  set firewall.${FIREWALLZONE}_fwd.src=${FIREWALLZONE}
  set firewall.${FIREWALLZONE}_fwd.dest=wan
  set firewall.${FIREWALLZONE}_dhcp=rule
  set firewall.${FIREWALLZONE}_dhcp.name=${FIREWALLZONE}_DHCP
  set firewall.${FIREWALLZONE}_dhcp.src=${FIREWALLZONE}
  set firewall.${FIREWALLZONE}_dhcp.target=ACCEPT
  set firewall.${FIREWALLZONE}_dhcp.proto=udp
  set firewall.${FIREWALLZONE}_dhcp.dest_port=67-68
  set firewall.${FIREWALLZONE}_dns=rule
  set firewall.${FIREWALLZONE}_dns.name=${FIREWALLZONE}_DNS
  set firewall.${FIREWALLZONE}_dns.src=${FIREWALLZONE}
  set firewall.${FIREWALLZONE}_dns.target=ACCEPT
  set firewall.${FIREWALLZONE}_dns.proto='tcp udp'
  set firewall.${FIREWALLZONE}_dns.dest_port=53
EOF
uci commit

