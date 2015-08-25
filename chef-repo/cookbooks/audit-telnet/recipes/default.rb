#
# Cookbook Name:: audit-telnet
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

if node['platform_family'] == 'rhel'
  control_group 'telnet' do
    control 'telnet-server' do
      it 'is not installed' do
        expect(package 'telnet-server').not_to be_installed
      end
    end

    control 'telent.socket' do
      it 'is not running' do
        expect(service 'telnet.socket').not_to be_running
      end
      it 'is not enabled' do
        expect(service 'telnet.socket').not_to be_enabled
      end
    end

    control 'telnet port (23)' do
      it 'is not listening' do
        expect(port 23).not_to be_listening
      end
    end
  end
elsif node['platform_family'] == 'debian'
  control_group 'telnet' do
    control 'telnetd' do
      it 'is not installed' do
        expect(package 'telnetd').not_to be_installed
      end
    end

    control 'xinetd' do
      it 'is not running' do
        expect(service 'xinetd').not_to be_running
      end
      it 'is not enabled' do
        expect(service 'xinetd').not_to be_enabled
      end
    end

    control 'telnet port (23)' do
      it 'is not listening' do
        expect(port 23).not_to be_listening
      end
    end
  end
end
