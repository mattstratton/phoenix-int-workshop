#
# Cookbook Name:: telnet
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'audit-telnet::default'

if node['platform_family'] == 'rhel'
  package_name = 'telnet-server'
  service_name = 'telnet.socket'
elsif node['platform_family'] == 'debian'
  package_name = 'telnetd'
  service_name = 'xinetd'
end

service service_name do
  action [:stop, :disable]
end

package package_name do
  action :remove
end
