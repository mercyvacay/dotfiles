function mitm_setup
  sudo sysctl -w net.ipv6.conf.all.forwarding=1
  sudo sysctl -w net.ipv4.ip_forward=1
  sudo sysctl -w net.ipv4.conf.all.send_redirects=0
  sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
  sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8080
  sudo ip6tables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
  sudo ip6tables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8080
  mitmweb --mode transparent --showhost
end
