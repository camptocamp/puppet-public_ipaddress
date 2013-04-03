require 'timeout'
require 'open-uri'

def cache
  '/var/tmp/public_ip.fact.cache'
end

def can_connect? (wait_sec=2, url)
  Timeout::timeout(wait_sec) { open(url) }
  return true
  rescue Timeout::Error
    return false
  rescue
    return false
end

def get_ip (wait_sec=2, html=false, url)
  if can_connect? wait_sec=wait_sec, url=url
    response = open(url).read
    value = html ? response[/.*: ([^<]+)<.*/, 1] : response
    return unless response =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/
    update_cache(value) if value
    value
  end
end

def update_cache (value)
  if value
    File.open(cache, 'w') do |f|
      f.write(value)
    end
  end
end

def get_cache
  if File.exists?(cache)
    File.read(cache)
  end
end

Facter.add(:public_ipaddress) do
  has_weight 100
  setcode { get_ip 'http://ident.me' }
end

Facter.add(:public_ipaddress) do
  has_weight 90
  setcode { get_ip 'http://icanhazip.com' }
end

Facter.add(:public_ipaddress) do
  has_weight 80
  setcode { get_ip 'http://checkip.dyndns.org', html=true }
end

Facter.add(:public_ipaddress) do
  has_weight 50
  setcode { get_ip 'http://ifconfig.me/ip', wait_sec=5 }
end

Facter.add(:public_ipaddress) do
  setcode { get_cache }
end
