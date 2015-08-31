#
# Cookbook Name:: my_chef-client
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'my_chef-client::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes the default chef-client recipe' do
      expect(chef_run).to include_recipe 'chef-client::default'
    end

    it 'includes the chef-client config recipe' do
      expect(chef_run).to include_recipe 'chef-client::config'
    end

    it 'sets the chef-client to run every 5 minutes' do
      expect(chef_run.node['chef_client']['interval']).to eq '300'
    end

    it 'sets the chef-client run to have a splay of 1 minute' do
      expect(chef_run.node['chef_client']['splay']).to eq '60'
    end

    it 'enables audit_mode' do
      expect(chef_run.node['chef_client']['config']['audit_mode']).to eq 'enabled'
    end
  end
end
