require 'spec_helper'
require 'facter/util/public_ipaddress'

describe 'public_ipaddress fact' do
  before :each do
    Facter.clear
  end

  context 'when all get_ip calls fail' do
    it 'should use cache' do
      Facter::Util::PublicIpaddress.stubs(:get_ip).returns(nil)
      File.expects(:exists?).with('/var/tmp/public_ip.fact.cache').returns(true)
      File.expects(:read).with('/var/tmp/public_ip.fact.cache').returns('1.2.3.4')
      Facter.value(:public_ipaddress).should == '1.2.3.4'
    end
  end

  context 'when getting value from ident.me' do
    it 'should return value' do
      Facter::Util::PublicIpaddress.expects(:get_ip).with('http://ident.me').returns('2.3.4.5')
      Facter::Util::PublicIpaddress.expects(:get_ip).with('http://icanhazip.com').never
      Facter::Util::PublicIpaddress.expects(:get_ip).with('http://checkip.dyndns.org').never
      Facter::Util::PublicIpaddress.expects(:get_ip).with('http://ifconfig.me/ip').never
      Facter.value(:public_ipaddress).should == '2.3.4.5'
    end
  end

  context 'when backend returns invalid value' do
    it 'should ignore the backend' do
      # How do I stub Kernel#open with no class?
    end
  end
end
