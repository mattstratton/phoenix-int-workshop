#
# Cookbook Name:: my_packages
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

packages = []
if node['platform_family'] == 'rhel'
  packages = %w(bash openssl ca-certificates openssh tzdata)
elsif node['platform_family'] == 'debian'
  packages = %w(bash openssl ca-certificates openssh-client openssh-server tzdata)
end

packages.each do |p|
  package p do
    action :upgrade
  end
end

include_recipe 'audit-packages::default'
