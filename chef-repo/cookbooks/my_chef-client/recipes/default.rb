#
# Cookbook Name:: my_chef-client
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

node.default['chef_client']['config']['audit_mode'] = 'enabled'
# node.default['chef_client']['interval'] = '300'
# node.default['chef_client']['splay'] = '60'

include_recipe 'chef-client::config'
include_recipe 'chef-client::default'
