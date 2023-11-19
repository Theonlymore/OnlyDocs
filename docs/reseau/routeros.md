# RouterOS by Mikrotik

## Dst Nat

ip firewall/nat add chain=dstnat dst-port=25565 in-interface=ether1 action=dst-nat protocol=tcp to-addresses=192.168.1.208 to-ports=22 


