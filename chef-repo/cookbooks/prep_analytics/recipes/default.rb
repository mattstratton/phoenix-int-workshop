#
# Cookbook Name:: prep_analytics
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'ntp'

service 'ntpd' do
  action [:start, :enable]
end

service 'qpidd' do
  action [:stop, :disable]
end

service 'selinux' do
  action [:stop, :disable]
end
