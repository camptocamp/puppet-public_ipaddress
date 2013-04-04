require 'spec_helper'
require 'facter/util/public_ipaddress'

describe Facter::Util::PublicIpaddress do

  let (:openuri) do
    OpenURI
  end

  describe Facter::Util::PublicIpaddress.cache do
    it 'should return cache file path' do
      Facter::Util::PublicIpaddress.cache.should == '/var/tmp/public_ip.fact.cache'
    end
  end

  describe Facter::Util::PublicIpaddress.can_connect?('http://invalid.domain.tld') do
    it 'should return false if request times out' do
      Timeout.expects(:timeout).raises(Timeout::Error)
      Facter::Util::PublicIpaddress.can_connect?('http://invalid.domain.tld').should == false
    end

    it 'should return true if connect succeeds' do
      openuri.stubs(:open_uri).returns('abc')
      Facter::Util::PublicIpaddress.can_connect?('http://invalid.domain.tld').should == true
    end
  end

  describe Facter::Util::PublicIpaddress.get_ip('http://invalid.domain.tld') do
    it 'should return nil if connection fails' do
      Facter::Util::PublicIpaddress.expects(:can_connect?).returns(false)
      Facter::Util::PublicIpaddress.get_ip('http://invalid.domain.tld').should be_nil
    end

    # Find a way to stub Kernel#open for other tests:
    #  - test wrong value returned by site
    #  - test update_cache is called
  end

  describe Facter::Util::PublicIpaddress.update_cache('1.2.3.4') do
    it 'should write value to file' do
      File.expects(:open).with('/var/tmp/public_ip.fact.cache', 'w')
      #File.any_instance.expects(:write).with('1.2.3.4') # why not?
      Facter::Util::PublicIpaddress.update_cache('1.2.3.4')
    end
  end

  describe Facter::Util::PublicIpaddress.get_cache do
    it 'should return nil if file does not exist' do
      File.expects(:exists?).returns(false)
      Facter::Util::PublicIpaddress.get_cache.should == nil
    end

    it 'should return file content if it exists' do
      File.expects(:exists?).returns(true)
      File.expects(:read).with('/var/tmp/public_ip.fact.cache').returns('5.4.3.2')
      Facter::Util::PublicIpaddress.get_cache.should == '5.4.3.2'
    end
  end
end
