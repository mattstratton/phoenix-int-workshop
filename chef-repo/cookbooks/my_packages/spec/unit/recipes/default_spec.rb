#
# Cookbook Name:: my_packages
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'my_packages::default' do
  context 'When all attributes are defalut, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes the audit-packages recipe' do
      expect(chef_run).to include_recipe 'audit-packages::default'
    end
  end
  context 'When all attributes are default, on an rhel platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.1.1503')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    packages = %w(openssl ca-certificates openssh tzdata).each do |p|
      it "upgrades #{p}" do
        expect(chef_run).to upgrade_package p
      end
    end
  end
  context 'When all attributes are default, on an ubuntu platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    packages = %w(openssl ca-certificates openssh-client openssh-server tzdata).each do |p|
      it "upgrades #{p}" do
        expect(chef_run).to upgrade_package p
      end
    end
  end
end
