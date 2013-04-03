require 'facter/util/public_ipaddress'


Facter.add(:public_ipaddress) do
  has_weight 100
  setcode { Facter::Util::PublicIpaddress::get_ip 'http://ident.me' }
end

Facter.add(:public_ipaddress) do
  has_weight 90
  setcode { Facter::Util::PublicIpaddress::get_ip 'http://icanhazip.com' }
end

Facter.add(:public_ipaddress) do
  has_weight 80
  setcode { Facter::Util::PublicIpaddress::get_ip 'http://checkip.dyndns.org', html=true }
end

Facter.add(:public_ipaddress) do
  has_weight 50
  setcode { Facter::Util::PublicIpaddress::get_ip 'http://ifconfig.me/ip', wait_sec=5 }
end

Facter.add(:public_ipaddress) do
  setcode { Facter::Util::PublicIpaddress::get_cache }
end
