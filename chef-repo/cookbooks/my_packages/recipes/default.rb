#
# Cookbook Name:: my_packages
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

packages = %w(openssl ca-certificates openssh tzdata)

packages.each do |p|
  package p do
    action :upgrade
  end
end

include_recipe 'audit-packages::default'
