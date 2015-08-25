#
# Cookbook Name:: prep_analytics
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'prep_analytics::default' do
  context 'When all attributes are default, on CentOS 7.1' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        :platform => 'centos',
        :version => '7.1.1503'
      )
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs ntp' do
      expect(chef_run).to install_package 'ntp'
    end

    it 'starts ntp' do
      expect(chef_run).to start_service 'ntpd'
    end

    it 'enables ntp' do
      expect(chef_run).to enable_service 'ntpd'
    end

    it 'stops qpidd' do
      expect(chef_run).to stop_service 'qpidd'
    end

    it 'disables qpidd' do
      expect(chef_run).to disable_service 'qpidd'
    end

    it 'stops selinux' do
      expect(chef_run).to stop_service 'selinux'
    end

    it 'disables selinux' do
      expect(chef_run).to disable_service 'selinux'
    end
  end
end
